
from ....schema.endereco.endereco_schema import Endereco

def SQL_UPDATE_ENDERECO(set_edit, where_codition, return_data=""):
    sql = f"""
    UPDATE 
        public.endereco    
    SET 
        {set_edit}
    WHERE 
        {where_codition}
    {return_data} 
    """.upper()

    print(sql)

    return sql
    