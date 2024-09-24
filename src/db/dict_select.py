def split_table_dict(data, pessoa=False, escrivao=False, delegado=False):
    if pessoa:
        tabelas = ["pessoa", "endereco", "contato", "usuario"]
        dict_data = {tabela: {} for tabela in tabelas}
    
    if escrivao:
        tabelas = ["escrivao"]
        dict_data = {tabela: {} for tabela in tabelas}

    if delegado:
        tabelas = ["delegado"]
        dict_data = {tabela: {} for tabela in tabelas}


    # Itera sobre cada chave-valor no dicionário
    for key, value in data.items():
        for nome in tabelas:
            if key.startswith(nome):
                # Remove o prefixo e adiciona ao dicionário correto
                clean_key = key[len(nome) + 1:]  # remove o prefixo e o '_'
                dict_data[nome][clean_key] = value
                break

    return dict_data