def SQL_SELECT_VITIMA_INQUERITO_LIST(id_inquerito=None):
    sql =  f"""
        SELECT 
            E.env_inq_id AS envolvidos_inquerito_id_envolvidos, 
            E.fk_vitima AS envolvidos_inquerito_fk_vitima,
            E.fk_inquerito AS envolvidos_inquerito_fk_inquerito,
            
            V.vitima_id, 
            V.faccao AS vitima_faccao, 
            V.vulgo AS vitima_vulgo, 
            V.fk_pessoa AS vitima_fk_pessoa,  
            V.ligacao_suspeito AS vitima_ligacao_suspeito, 
            V.situacao AS vitima_situacao,
            
            PE.pessoa_id as pessoa_pessoa_id

        FROM 
            public.envolvidos_inquerito E
        LEFT JOIN 
            public.vitima V ON E.fk_vitima = V.vitima_id
        LEFT JOIN
            public.pessoa PE ON V.fk_pessoa = PE.pessoa_id
        WHERE 
            E.fk_inquerito = {id_inquerito}
        
    """
    print(sql)

    return sql 

def SQL_SELECT_VITIMA_PESSOA(id=None):
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
            c.email AS contato_email

        FROM pessoa p
        LEFT JOIN  endereco e ON e.fk_pessoa = p.pessoa_id
        LEFT JOIN  contato c ON c.fk_pessoa = p.pessoa_id

        WHERE p.pessoa_id = '{id}'
    """

    print(sql)

    return sql

def SQL_SELECT_VITIMA_UNIQUE(cpf=None, id=None):
    if cpf:
        sqlWhere = f"p.cpf = '{cpf}'"
    else:
        sqlWhere = f"v.vitima_id = {id};"
    sql =  f"""
        SELECT 
            p.pessoa_id,
            p.nome AS pessoa_nome, 
            p.nome_social AS pessoa_nome_social, 
            TO_CHAR(p.nascimento, 'YYYY-MM-DD')::TEXT AS pessoa_nascimento,
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

            v.vitima_id, 
            v.faccao AS vitima_faccao, 
            v.vulgo AS vitima_vulgo, 
            v.ligacao_suspeito AS vitima_ligacao_suspeito,
            v.situacao AS vitima_situacao,
            v.fk_pessoa AS vitima_fk_pessoa  

        FROM 
            pessoa p
        LEFT JOIN 
            contato c ON p.pessoa_id = c.fk_pessoa
        LEFT JOIN 
            endereco e ON p.pessoa_id = e.fk_pessoa
        LEFT JOIN 
            vitima v ON p.pessoa_id = v.fk_pessoa
        WHERE  
            {sqlWhere}
    """
    return sql 