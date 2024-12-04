from pytz import timezone
from typing import Optional, List
from datetime import datetime, timedelta
from jose import jwt

from ..utils.env import arq_env


def _criar_token(tipo_token:str, tempo_vida:timedelta, sub:str):
    """Função estrutura do token e codificar o token
    """
    payload = {}

    ac = timezone("America/Rio_Branco")
    expira = datetime.now(tz=ac) + tempo_vida

    payload["type"] = tipo_token
    payload["exp"] = expira
    payload["iat"] = datetime.now(tz=ac)
    payload["sub"] = str(sub)

    return jwt.encode(payload, arq_env.get_env("JWT_SECRET"), algorithm=arq_env.get_env("ALGORITHM"))

def criar_token_acesso(sub:str):
    """ Função que criar 
        https:/jwt.io
    """
    return _criar_token(
        tipo_token="access_token",
        tempo_vida=timedelta(minutes=480),
        sub=sub
    )


def criar_token_esqueci_senha(user_id, key):
    try:
        payload = {}

        ac = timezone("America/Rio_Branco")
        expira = datetime.now(tz=ac) + timedelta(hours=1)

        payload["user_id"] = user_id
        payload["exp"] = expira
        payload["key"] = key
        return jwt.encode(payload, arq_env.get_env("JWT_SECRET"), algorithm=arq_env.get_env("ALGORITHM"))
    except:
        pass 



def decodificar_token_esqueci_senha(token):
    try:
        if token is not None:
            payload = jwt.decode(
                token,
                arq_env.get_env("JWT_SECRET"),
                algorithms=[arq_env.get_env("ALGORITHM")],
                options={"verify_aud": False}
            )
            return payload
        else:
            pass
    except:
        pass
        
