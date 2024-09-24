from ....schema.usuario.usuario_schema import UsuarioAuth

def SQL_SELECT_INQUERITO(user):
    sql =  f"""
        SELECT 
            I.inquerito_id, 
            I.n_sinesp AS inquerito_n_sinesp, 
            I.n_ip AS inquerito_n_ip, 
            I.tipo_ip AS inquerito_tipo_ip, 
            I.data_instaraucao AS inquerito_data_instaraucao, 
            I.data_ocorrencia AS inquerito_data_ocorrencia, 
            I.tipificacao AS inquerito_tipificacao, 

            e.endereco_id, 
            e.logradouro AS endereco_logradouro,
            e.n_residencia AS endereco_n_residencia,
            e.bairro AS endereco_bairro, 
            e.cidade AS endereco_cidade, 
            e.cep AS endereco_cep,
            e.uf AS endereco_uf

	    FROM public.inquerito I
        INNER JOIN endereco e ON I.fk_endereco =  e.endereco_id 
        WHERE fk_escrivao = {user["funcao"]["cod_escrivao"]} AND fk_cartorio = {user["funcao"]["cartorio"]["cod_cartorio"]}

    """
    print(sql)
    return sql 

