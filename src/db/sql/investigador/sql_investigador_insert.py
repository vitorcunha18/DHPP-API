def SQL_INSERT_INVESTIGADOR(fk_equipe, fk_pessoa):
    return f"""
        INSERT INTO public.investigador(
            fk_equipe, fk_pessoa)
        VALUES 
            ('{fk_equipe}', 
            '{fk_pessoa}');
    """
