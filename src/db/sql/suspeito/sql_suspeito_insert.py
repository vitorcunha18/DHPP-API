from ....schema.suspeito.suspeito_schema import Suspeito


def SQL_INSERT_SUSPEITO(dados: Suspeito, fk_pessoa):
    return f"""
        INSERT INTO public.suspeito(
            faccao, vulgo, fk_pessoa)
        VALUES 
            ('{dados.faccao}', 
            '{dados.vulgo}',
            '{fk_pessoa}')
        RETURNING id;
    """
