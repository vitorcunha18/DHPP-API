from ....schema.vitima.vitima_schema import Vitima


def SQL_INSERT_VITIMA(dados: Vitima, fk_pessoa):
    return f"""
        INSERT INTO public.vitima(
            faccao, vulgo, fk_pessoa)
        VALUES 
            ('{dados.faccao}', 
            '{dados.vulgo}',
            '{fk_pessoa}')
        RETURNING vitima_id;
    """
