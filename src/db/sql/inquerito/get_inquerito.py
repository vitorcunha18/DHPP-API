from psycopg.rows import dict_row
from ..inquerito.sql_inquerito_select import SQL_SELECT_INQUERITO, SQL_SELECT_INQUERITO_UNIQUE
from .dict_select_inquerito import split_table_inquerito

async def get_inquerito_dict(conn, user, unique=False, inquerito=None ):
    dict_reponse = {}
    dict_response_inqueritos = []

    async with conn.cursor(row_factory=dict_row) as cursor:
        # inquerito

        if not unique:
            if user["funcao"]["cartorio"]["cod_cartorio"] == 5:
                await cursor.execute(SQL_SELECT_INQUERITO(user=user, all_cartorio=True))
            else:
                await cursor.execute(SQL_SELECT_INQUERITO(user=user))
        else:
            await cursor.execute(SQL_SELECT_INQUERITO_UNIQUE(inquerito=inquerito))

        list_inquerito = await cursor.fetchall()

        if list_inquerito is None:
            return None
        
        for inquerito_dict in list_inquerito:
            dict_reponse = {}
            dict_inquerito = split_table_inquerito(data=inquerito_dict, inquerito=True)

            dict_reponse.update(dict_inquerito["inquerito"])

            dict_reponse["endereco"] = {**dict_inquerito["endereco"]}
            dict_reponse["cartorio"] = {**dict_inquerito["cartorio"]}

            dict_response_inqueritos.append(dict_reponse)

        return dict_response_inqueritos