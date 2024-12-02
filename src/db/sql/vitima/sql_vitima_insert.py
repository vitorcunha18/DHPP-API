from ....schema.vitima.vitima_schema import Vitima


def SQL_INSERT_VITIMA(dados: Vitima, fk_pessoa):
    return f"""
        INSERT INTO public.vitima(
            faccao, vulgo, ligacao_suspeito, situacao, fk_pessoa)
        VALUES 
            ('{dados.faccao}', 
            '{dados.vulgo}',
            '{dados.ligacao_suspeito}',
            '{dados.situacao}',
            '{fk_pessoa}')
        RETURNING vitima_id;
    """
