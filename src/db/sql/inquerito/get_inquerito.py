from psycopg.rows import dict_row
from ..inquerito.sql_inquerito_select import SQL_SELECT_INQUERITO
from .dict_select_inquerito import split_table_inquerito

async def get_inquerito_dict(conn, user):
    dict_reponse = {}
    dict_response_inqueritos = []

    async with conn.cursor(row_factory=dict_row) as cursor:
        # inquerito
        print("aqui ")
        await cursor.execute(SQL_SELECT_INQUERITO(user=user))

        list_inquerito = await cursor.fetchall()

        print("aqui ")
        if list_inquerito is None:
            return None
        
        for inquerito_dict in list_inquerito:
            dict_reponse = {}
            dict_inquerito = split_table_inquerito(data=inquerito_dict, inquerito=True)

            dict_reponse.update(dict_inquerito["inquerito"])

            dict_reponse["endereco"] = {**dict_inquerito["endereco"]}

            dict_response_inqueritos.append(dict_reponse)

        return dict_response_inqueritos