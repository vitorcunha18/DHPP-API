from ....schema.pessoa.pessoa_schema import Pessoa
from ....schema.endereco.endereco_schema import Endereco
from ....schema.contato.contato_schema import Contato
from ....schema.usuario.usuario_schema import Usuario


def SQL_INSERT_PESSOA(dados: Pessoa):
    return f"""
        INSERT INTO public.pessoa(
	        nome, nome_social, nascimento, cpf, sexo, etnia, identidade_genero, pdc)
	    VALUES 
            ('{dados.nome}', 
            '{dados.nome_social}', 
            '{dados.nascimento}', 
            '{dados.cpf}', 
            '{dados.sexo}', 
            '{dados.etnia}', 
            '{dados.identidade_genero}', 
            '{dados.pdc}')
        RETURNING id;
    """
    

def SQL_INSERT_ENDERECO(dados: Endereco, fk_pessoa):
    return f"""
        INSERT INTO public.endereco(
            logradouro, n_residencia, bairro, cidade, cep, uf, fk_pessoa)
        VALUES 
            ('{dados.logradouro}', 
            '{dados.n_residencia}', 
            '{dados.bairro}', 
            '{dados.cidade}', 
            '{dados.cep}', 
            '{dados.cep}', 
            '{dados.uf}', 
            '{fk_pessoa}');
    """
    

def SQL_INSERT_CONTATO(dados: Contato, fk_pessoa):
    return f"""
        INSERT INTO public.contato(
            celular, telefone, email, fk_pessoa)
        VALUES 
            ('{dados.celular}', 
            '{dados.telefone}', 
            '{dados.email}', 
            {fk_pessoa});
    """

def SQL_INSERT_USUARIO(dados: Usuario, fk_pessoa):
    return  f"""
        INSERT INTO public.usuario(
            usuario, senha,  fk_pessoa)
        VALUES 
            ('{dados.usuario}', 
            '{dados.senha}', 
            {fk_pessoa};
    """