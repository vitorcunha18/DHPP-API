from ....schema.usuario.usuario_schema import UsuarioAuth

def SQL_SELECT_INQUERITO(user, all_cartorio=False):
    if not all_cartorio:
        return f"""
            SELECT 
                I.inquerito_id,
                I.n_sinesp AS inquerito_n_sinesp, 
                I.n_ip AS inquerito_n_ip, 
                I.data_instauracao AS inquerito_data_instauracao, 
                I.data_ocorrencia AS inquerito_data_ocorrencia, 
                I.tipificacao AS inquerito_tipificacao,
                I.periodo_ocorrencia AS inquerito_periodo_ocorrencia,
                I.tipo_instauracao AS inquerito_tipo_instauracao,
                I.fk_equipe AS inquerito_equipe_investigadora,

                e.endereco_id, 
                e.logradouro AS endereco_logradouro,
                e.n_residencia AS endereco_n_residencia,
                e.bairro AS endereco_bairro, 
                e.cidade AS endereco_cidade, 
                e.cep AS endereco_cep,
                e.uf AS endereco_uf,

                c.nome AS cartorio_nome

            FROM public.inquerito I
            INNER JOIN endereco e ON I.fk_endereco =  e.endereco_id 
            INNER JOIN cartorio c ON I.fk_cartorio =  c.cartorio_id 
            WHERE fk_escrivao = {user["funcao"]["cod_escrivao"]} AND fk_cartorio = {user["funcao"]["cartorio"]["cod_cartorio"]}
            ORDER BY inquerito_id desc
        """
    else:
        return f"""
            SELECT 
                I.inquerito_id,
                I.n_sinesp AS inquerito_n_sinesp, 
                I.n_ip AS inquerito_n_ip, 
                I.data_instauracao AS inquerito_data_instauracao, 
                I.data_ocorrencia AS inquerito_data_ocorrencia, 
                I.tipificacao AS inquerito_tipificacao,
                I.periodo_ocorrencia AS inquerito_periodo_ocorrencia,
                I.tipo_instauracao AS inquerito_tipo_instauracao,
                I.fk_equipe AS inquerito_equipe_investigadora,

                e.endereco_id, 
                e.logradouro AS endereco_logradouro,
                e.n_residencia AS endereco_n_residencia,
                e.bairro AS endereco_bairro, 
                e.cidade AS endereco_cidade, 
                e.cep AS endereco_cep,
                e.uf AS endereco_uf,

                c.nome AS cartorio_nome

            FROM public.inquerito I
            INNER JOIN endereco e ON I.fk_endereco =  e.endereco_id 
            INNER JOIN cartorio c ON I.fk_cartorio =  c.cartorio_id 
            ORDER BY inquerito_id desc
        """



def SQL_SELECT_INQUERITO_UNIQUE(inquerito):
    sql =  f"""
        SELECT 
            I.inquerito_id,
            I.n_sinesp AS inquerito_n_sinesp, 
            I.n_ip AS inquerito_n_ip, 
            I.data_instauracao AS inquerito_data_instauracao, 
            I.data_ocorrencia AS inquerito_data_ocorrencia, 
            I.tipificacao AS inquerito_tipificacao,
            I.periodo_ocorrencia AS inquerito_periodo_ocorrencia,
            I.tipo_instauracao AS inquerito_tipo_instauracao,
            I.fk_equipe AS inquerito_equipe_investigadora,

            e.endereco_id, 
            e.logradouro AS endereco_logradouro,
            e.n_residencia AS endereco_n_residencia,
            e.bairro AS endereco_bairro, 
            e.cidade AS endereco_cidade, 
            e.cep AS endereco_cep,
            e.uf AS endereco_uf

	    FROM public.inquerito I
        INNER JOIN endereco e ON I.fk_endereco =  e.endereco_id 
        WHERE inquerito_id = {inquerito}
    """
    print(sql)
    return sql 
