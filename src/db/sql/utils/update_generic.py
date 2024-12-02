def SQL_UPDATE_GENERICO(usuario, table, dados, extra="" ,fk_name=None, fk=False):
    if not fk:
        sql =  f"""
            UPDATE {table}
            SET {dados}
            WHERE id = {usuario} 
            {extra}
        """
    else:
        sql =  f"""
            UPDATE {table}
            SET {dados}
            WHERE {fk_name} = {usuario}
            {extra}
        """
    print(sql)

    return sql 
