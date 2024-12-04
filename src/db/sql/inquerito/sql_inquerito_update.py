from ....schema.inquerito.inquerito_schema import InqueritoUpdate, Processo, EnvolvidosInquerito

def SQL_UPDATE_INQUERITO(set_edit, where_codition, return_data=""):
    sql = f"""
    UPDATE 
        public.inquerito     
    SET 
        {set_edit}
    WHERE 
        {where_codition}
    RETURNING 
        {return_data} 
    """

    print(sql)

    return sql