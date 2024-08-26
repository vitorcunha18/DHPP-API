from ....schema.cartorio.cartorio_schema import CartorioCreate

def SQL_INSERT_CARTORIO(dados: CartorioCreate):
    return f"""
        INSERT INTO public.cartorio(
            nome, fk_delegado)
        VALUES 
            ('{dados.nome}', 
            '{dados.n_responsavel}');
    """



def SQL_SELECT_CARTORIO_ALL():
    return f"""
       SELECT 
            cart.id, cart.nome, pes.nome as delegado
        FROM 
            public.cartorio as cart
        INNER JOIN 
            public.delegado as del
        ON
            cart.fk_delegado = del.id
        INNER JOIN
            public.pessoa as pes
        ON
            del.fk_pessoa = pes.id
    """


def SQL_SELECT_CARTORIO(codigo):
    return f"""
       SELECT 
            cart.id, cart.nome, pes.nome as delegado
        FROM 
            public.cartorio as cart
        INNER JOIN 
            public.delegado as del
        ON
            cart.fk_delegado = del.id
        INNER JOIN
            public.pessoa as pes
        ON
            del.fk_pessoa = pes.id
        WHERE
            cart.id = '{codigo}'
    """



def SQL_UPDATE_CARTORIO(dados, codigo):
    sql =  f"""
        UPDATE cartorio
        SET {dados}
        WHERE id = {codigo}
        RETURNING *
    """

    return sql 
