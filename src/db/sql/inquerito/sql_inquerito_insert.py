from ....schema.inquerito.inquerito_schema import Inquerito, Processo, EnvolvidosInquerito

def SQL_INSERT_INQUERITO(dados: Inquerito, escrivao, cartorio, endereco):
    return f"""
        INSERT INTO public.inquerito (
	        n_sinesp, n_ip, tipo, data_instaraucao, data_ocorrencia, fk_escrivao, fk_cartorio, fk_endereco
            )
	    VALUES 
            ('{dados.n_sinesp}', 
            '{dados.n_ip}', 
            '{dados.tipo}', 
            '{dados.data_instauracao}', 
            '{dados.data_instauracao}', 
            '{escrivao}', 
            '{cartorio}', 
            '{endereco}')
        RETURNING id;
    """.upper()
    


def SQL_INSERT_PROCESSO(dados: Processo, inquerito):
    return f"""
        INSERT INTO public.processo(
	        n_processo, representacao_judicial, cumprimento_mandado, fk_inquerito)
	    VALUES 
            ('{dados.n_processo}', 
            '{dados.representacao_juducial}', 
            '{dados.cumprimento_mandado}',
            '{inquerito}')
        RETURNING id;
    """.upper()
    

    
def SQL_INSERT_ENVOVIDOS_INQUERITO():
    return f"""
        INSERT INTO public.envolvidos_inquerito (
	        fk_vitima, fk_suspeito, fk_inquerito)
	    VALUES 
            (%s %s %s)
        RETURNING id;
    """
    
