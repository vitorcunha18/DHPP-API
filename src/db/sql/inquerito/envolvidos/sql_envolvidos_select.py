

def SQL_SELECT_ENVOLVIDOS(id_inquerito):
    sql =  f"""
        SELECT 
            env_inq_id, fk_vitima, fk_suspeito, fk_inquerito
	    FROM 
            public.envolvidos_inquerito; 
        WHERE fk_iquerito = {id_inquerito}
    """
    return sql 
