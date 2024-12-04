from ....auth.security import verificar_senha

def SQL_SELECT_PESSOA(cpf=False, id=None):
    if cpf:
        sqlWhere = f"p.cpf = '{cpf}'"
    else:
        sqlWhere = f"p.pessoa_id = '{id}'"

    sql =  f"""
       SELECT
            p.pessoa_id,
            p.nome AS pessoa_nome, 
            p.nome_social AS pessoa_nome_social, 
            p.nascimento AS pessoa_nascimento,
            p.cpf AS pessoa_cpf,
            p.sexo AS pessoa_sexo,
            p.etnia AS pessoa_etnia,
            p.lgbt AS pessoa_lgbt,
            p.pcd AS pessoa_pcd,

            e.endereco_id, 
            e.logradouro AS endereco_logradouro,
            e.n_residencia AS endereco_n_residencia,
            e.bairro AS endereco_bairro, 
            e.cidade AS endereco_cidade, 
            e.cep AS endereco_cep,
            e.uf AS endereco_uf,

            c.contato_id, 
            c.celular AS contato_celular, 
            c.telefone AS contato_telefone, 
            c.email AS contato_email,

            u.usuario_id, 
            u.usuario AS usuario_usuario

        FROM pessoa p
        INNER JOIN endereco e ON e.fk_pessoa = p.pessoa_id
        INNER JOIN contato c ON c.fk_pessoa = p.pessoa_id
        INNER JOIN usuario u ON u.fk_pessoa = p.pessoa_id

        WHERE {sqlWhere}
    """

    print(sql)
    return sql 


def SQL_SELECT_USER(user=None, id =None):
    if user:
        sqlWhere = f"usuario.usuario ='{user}'"
    else:
        sqlWhere = f"usuario.usuario_id = '{id}'"

    sql =  f"""
        SELECT 
            usuario.usuario_id, usuario.usuario, usuario.senha,  pessoa.pessoa_id ,pessoa.nome
        FROM 
            pessoa
        INNER JOIN 
            contato 
        ON
            pessoa.pessoa_id = contato.fk_pessoa 
        INNER JOIN 
            endereco
        ON
            pessoa.pessoa_id = endereco.fk_pessoa
        INNER JOIN 
            usuario
        ON
            pessoa.pessoa_id = usuario.fk_pessoa

        WHERE {sqlWhere}
    """
    
    return sql 

def SQL_SELECT_TYPE_USER(id =None):
    sql =  f"""
        SELECT 
            p.*, 
            d.*,
            e.*
        FROM pessoa p
        LEFT JOIN delegado d ON p.pessoa_id = d.fk_pessoa
        LEFT JOIN escrivao e ON p.pessoa_id = e.fk_pessoa
        WHERE p.pessoa_id = {id};
    """
    
    return sql 