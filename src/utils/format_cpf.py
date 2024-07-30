def format_cpf(cpf:str):

    cpf_tratado = (str(cpf.replace(".",'').replace("-","")))

    return cpf_tratado


