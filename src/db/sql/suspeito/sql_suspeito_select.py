
def SQL_SELECT_SUSPEITO(cpf):
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
            suspeito
        ON
            pessoa.id = suspeito.fk_pessoa
        WHERE pessoa.cpf = '{cpf}'
    """
    return sql 

