
def SQL_SELECT_VITIMA(cpf):
    sql =  f"""
        SELECT 
            *
        FROM 
            pessoa
        INNER JOIN 
            contato 
        ON
            pessoa.id = contato.fk_pessoa 
        INNER JOIN 
            endereco
        ON
            pessoa.id = endereco.fk_pessoa
        INNER JOIN 
            vitima
        ON
            pessoa.id = vitima.fk_pessoa
        WHERE pessoa.cpf = '{cpf}'
    """
    return sql 

