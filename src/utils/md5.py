from hashlib import md5

def conversor_md5(senha:str) -> str:
    hash_object = md5()
    hash_object.update(senha.encode("utf-8"))

    senha_md5 = hash_object.hexdigest()

    return senha_md5

