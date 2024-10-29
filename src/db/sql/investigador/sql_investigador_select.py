
def SQL_SELECT_INVESTIGADOR(cpf):
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

def SQL_SELECT_ESCRIVAO_DATA(pessoa_id):
    sql =  f"""
        SELECT 
            escrivao.escrivao_id as escrivao_cod_escrivao,
            cartorio.cartorio_id AS escrivao_cod_cartorio,
            cartorio.nome AS escrivao_nome_cartorio,
            pessoa_delegado.nome AS escrivao_responsavel_cartorio
        FROM 
            pessoa
        INNER JOIN escrivao ON pessoa.pessoa_id = escrivao.fk_pessoa
        INNER JOIN cartorio ON cartorio.cartorio_id = escrivao.fk_cartorio
        INNER JOIN delegado ON delegado.delegado_id = cartorio.fk_delegado
        INNER JOIN pessoa AS pessoa_delegado ON pessoa_delegado.pessoa_id = delegado.fk_pessoa
        WHERE pessoa.pessoa_id = '{pessoa_id}'
    """
    return sql 

def SQL_SELECT_EQUIPES():
    sql =  f"""
        SELECT * FROM public.equipe_investigador
    """
    return sql 