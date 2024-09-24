from ....schema.delegado.delegado_schema import DelegadoCreate
from ....schema.endereco.endereco_schema import Endereco
from ....schema.contato.contato_schema import Contato

def SQL_INSERT_DELEGADO(dados: DelegadoCreate, fk_pessoa):
    return f"""
        INSERT INTO public.delegado(
            oab, fk_pessoa)
        VALUES 
            ('{dados.oab}', 
            '{fk_pessoa}');
    """


