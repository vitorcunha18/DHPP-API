from psycopg.rows import dict_row
from ..vitima.sql_vitima_select import   SQL_SELECT_VITIMA_UNIQUE, SQL_SELECT_VITIMA_INQUERITO_LIST, SQL_SELECT_VITIMA_PESSOA
from ..vitima.dict_select_vitima import split_table_vitima

async def get_vitima_dict(conn, user=None, cpf=None, unique=True, inquerito=None ):
    dict_response_inqueritos = []

    async with conn.cursor(row_factory=dict_row) as cursor:
        # inquerito

        if unique:
            print("unique")

            if user:
                await cursor.execute(SQL_SELECT_VITIMA_UNIQUE(id=user))
            else:
                await cursor.execute(SQL_SELECT_VITIMA_UNIQUE(cpf=cpf))

        else:
            print("not unique")
            await cursor.execute(SQL_SELECT_VITIMA_INQUERITO_LIST(id_inquerito=inquerito))

        list_vitima = await cursor.fetchall()

        print(list_vitima)

        if list_vitima is None:
            return None
        
        for inquerito_dict in list_vitima:
            dict_inquerito = split_table_vitima(data=inquerito_dict, inquerito=True, props_tabelas=["envolvidos_inquerito", "vitima", "pessoa"])
            

            await cursor.execute(SQL_SELECT_VITIMA_PESSOA(id=dict_inquerito["vitima"]['fk_pessoa']))
            
            list_pessoa = await cursor.fetchall()

            print(list_pessoa)

            for pessoa_dict in list_pessoa:
                dict_vitima_pessoa = {}

                dict_pessoa = split_table_vitima(data=pessoa_dict, inquerito=True, props_tabelas=["pessoa", "endereco", "contato"])

                dict_vitima_pessoa.update(dict_pessoa["pessoa"])

                dict_vitima_pessoa["endereco"] = {**dict_pessoa["endereco"]}
                dict_vitima_pessoa["contato"] = {**dict_pessoa["contato"]}
                dict_vitima_pessoa["envolvidos_inquerito"] = {**dict_inquerito["envolvidos_inquerito"]} 
                dict_vitima_pessoa["vitima"] = {**dict_inquerito["vitima"]}

                dict_response_inqueritos.append(dict_vitima_pessoa)

        return dict_response_inqueritos