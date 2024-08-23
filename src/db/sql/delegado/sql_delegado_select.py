
def SQL_SELECT_DELEGADO(chave):
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
            usuario
        ON
            pessoa.id = usuario.fk_pessoa
        INNER JOIN 
            delegado
        ON
            pessoa.id = delegado.fk_pessoa

        WHERE pessoa.cpf = '{chave}'
    """
    return sql 

