from psycopg.rows import dict_row
from .sql_usuario_select import SQL_SELECT_PESSOA
from ..escrivao.sql_escrivao_select import SQL_SELECT_ESCRIVAO_DATA
from ..delegado.sql_delegado_select import SQL_SELECT_DELEGADO_DATA
from ...dict_select import split_table_dict

async def getUser(conn, pessoa_id):
    dict_reponse = {}

    async with conn.cursor(row_factory=dict_row) as cursor:
            
        # usuario
        await cursor.execute(SQL_SELECT_PESSOA(id=pessoa_id))

        usuario = await cursor.fetchone()

        if usuario is None:
            return None

        dict_usuario = split_table_dict(data=usuario, pessoa=True)

        dict_reponse.update(dict_usuario["pessoa"])

        dict_reponse["endereco"] = {**dict_usuario["endereco"]}
        dict_reponse["contato"] = {**dict_usuario["contato"]}
        dict_reponse["usuario"] = {**dict_usuario["usuario"]}


        # escrivao
        await cursor.execute(SQL_SELECT_ESCRIVAO_DATA(pessoa_id=pessoa_id))
        escrivao = await cursor.fetchone()

        if escrivao:
            dict_escrivao = split_table_dict(data=escrivao, escrivao=True)

            dict_reponse["funcao"] = {**{
                    "nome_cargo": "Escrivao",
                    "cod_escrivao": dict_escrivao["escrivao"]["cod_escrivao"],
                    "cartorio": dict_escrivao["escrivao"]
                }
            }

            return dict_reponse
         

        # delegado
        await cursor.execute(SQL_SELECT_DELEGADO_DATA(pessoa_id=pessoa_id))
        delegado = await cursor.fetchall()

        if delegado:
            if type(delegado) == list:
                list_cartorio = [] 
                for cartorio in delegado:
                    dict_delegado = split_table_dict(data=cartorio, delegado=True)

                    list_cartorio.append(dict_delegado["delegado"])

                dict_reponse["funcao"] = {**{
                    "nome_cargo": "Delegado",
                    "cartorio": list_cartorio
                }}

                return dict_reponse

        return dict_reponse