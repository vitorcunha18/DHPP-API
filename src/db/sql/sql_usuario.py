from ...schema.pessoa.pessoa_schema import Pessoa

def SQL_INSERT(dados: Pessoa):
    sql =  f"""
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
            '{dados.pdc}');
    """

    print(sql)