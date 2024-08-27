
def SQL_SELECT_ESCRIVAO(cpf):
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
            escrivao
        ON
            pessoa.id = escrivao.fk_pessoa
        INNER JOIN 
            cartorio
        ON
            cartorio.id = escrivao.fk_cartorio

        WHERE pessoa.cpf = '{cpf}'
    """
    return sql 

