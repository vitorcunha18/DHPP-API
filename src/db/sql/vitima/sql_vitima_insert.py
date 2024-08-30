from ....schema.vitima.vitima_schema import VitimaCreate


def SQL_INSERT_VITIMA(dados: VitimaCreate, fk_pessoa):
    return f"""
        INSERT INTO public.vitima(
            faccao, vulgo, fk_pessoa)
        VALUES 
            ('{dados.faccao}', 
            '{dados.vulgo}',
            '{fk_pessoa}')
        RETURNING id;
    """
