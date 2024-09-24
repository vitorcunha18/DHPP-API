
def SQL_SELECT_DELEGADO(cpf):
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

        WHERE pessoa.cpf = '{cpf}'
    """
    return sql 


def SQL_SELECT_DELEGADO_DATA(pessoa_id):
    sql =  f"""
        SELECT
            cartorio.cartorio_id AS delegado_cod_cartorio,
            cartorio.nome AS delegado_nome_cartorio
        FROM 
            pessoa
        INNER JOIN delegado ON pessoa.pessoa_id = delegado.fk_pessoa
        INNER JOIN cartorio ON cartorio.fk_delegado = delegado.delegado_id
        WHERE pessoa.pessoa_id = '{pessoa_id}'
    """
    return sql 