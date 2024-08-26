from ....schema.escrivao.escrivao_schema import EscrivaoCreate



def SQL_INSERT_ESCRIVAO(dados: EscrivaoCreate, fk_pessoa):
    return f"""
        INSERT INTO public.escrivao(
            fk_cartorio, fk_pessoa)
        VALUES 
            ('{dados.cartorio}', 
            '{fk_pessoa}');
    """
