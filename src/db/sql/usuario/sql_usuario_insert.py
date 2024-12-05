from ....schema.pessoa.pessoa_schema import Pessoa
from ....schema.endereco.endereco_schema import Endereco
from ....schema.contato.contato_schema import Contato
from ....schema.usuario.usuario_schema import Usuario
from ....auth.security import gerar_hash_senha

def SQL_INSERT_PESSOA(dados: Pessoa):
    return f"""
        INSERT INTO public.pessoa(
	        nome, nome_social, nascimento, cpf, sexo, etnia, lgbt, pcd)
	    VALUES 
            ('{dados.nome}', 
            '{dados.nome_social}', 
            '{dados.nascimento}', 
            '{dados.cpf.replace(".","").replace("-","")}', 
            '{dados.sexo}', 
            '{dados.etnia}', 
            '{dados.lgbt}', 
            '{dados.pcd}')
        RETURNING pessoa_id;
    """.upper()
    
def SQL_INSERT_ENDERECO(dados: Endereco, fk_pessoa=None):
    if fk_pessoa == None:
        sql = f"""
            INSERT INTO public.endereco(
                logradouro, n_residencia, bairro, cidade, cep, uf, regional)
            VALUES 
                ('{dados.logradouro}', 
                '{dados.n_residencia}', 
                '{dados.bairro}', 
                '{dados.cidade}', 
                '{dados.cep}', 
                '{dados.uf}',
                '{dados.regional}')
            RETURNING endereco_id;
        """.upper()
        print(sql)
        return sql
    else:    
        sql = f"""
            INSERT INTO public.endereco(
                logradouro, n_residencia, bairro, cidade, cep, uf, fk_pessoa)
            VALUES 
                ('{dados.logradouro}', 
                '{dados.n_residencia}', 
                '{dados.bairro}', 
                '{dados.cidade}', 
                '{dados.cep}', 
                '{dados.uf}', 
                '{fk_pessoa}')
            RETURNING endereco_id;
        """.upper()
    
        print(sql)
        return sql
    
def SQL_INSERT_CONTATO(dados: Contato, fk_pessoa):
    return f"""
        INSERT INTO public.contato(
            celular, telefone, email, fk_pessoa)
        VALUES 
            ('{dados.celular}', 
            '{dados.telefone}', 
            '{dados.email}', 
            {fk_pessoa});
    """.upper()

def SQL_INSERT_USUARIO(dados: Usuario, fk_pessoa):
    return f"""
        INSERT INTO public.usuario(
            usuario, senha,  fk_pessoa)
        VALUES 
            ('{dados.usuario}', 
            '{gerar_hash_senha(dados.senha)}', 
            {fk_pessoa});
    """