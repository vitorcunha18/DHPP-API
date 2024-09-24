def split_table_inquerito(data, inquerito=False):
    if inquerito:
        tabelas = ["inquerito", "endereco"]
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