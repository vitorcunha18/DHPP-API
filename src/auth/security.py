from passlib.context import CryptContext

CRIPTO = CryptContext(schemes=['bcrypt'], deprecated='auto')

def verificar_senha (senha, hash_senha):
    """Função para verificar se a senha está correto, comparando a senha com o texto puro, informada pelo o usuário, e o hash da senha que estará salvo no banco de dados durante a criação da conta
    """
    return CRIPTO.verify(senha, hash_senha)

def gerar_hash_senha(senha):
    """Função que gera e retorna o hash da senha"""
    
    return CRIPTO.hash(senha)