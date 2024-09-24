from typing import Optional
from pydantic import BaseModel

from psycopg.rows import dict_row

from fastapi.security import OAuth2PasswordBearer
from fastapi import Depends, HTTPException, status

from jose import jwt, JWTError


from ..db.sql.usuario.sql_usuario_select import SQL_SELECT_USER
from ..db import object_postgres
from ..db.sql.usuario.get_user import getUser

from ..utils.env import arq_env
from .security import verificar_senha

import datetime as dt


oauth_schema = OAuth2PasswordBearer(
    tokenUrl=f"{arq_env.get_env("VERSION_PATH")}/auth/login",
    auto_error=False
)

class TokenData(BaseModel):
    username: Optional[str] = None

async def autenticar(user:str, senha:str, conn):
    """Função com a finalidade de verificar o usuario na base, para a criação do token.

       Parâmetros:[
            user:str -> usuario
            senha:str -> senha do usuario
            session: AsyncSession ->  sessão da base de dados
       ]

       Retorno:
            object{usuario}
    """

    async with conn.cursor(row_factory=dict_row) as cursor:
               
        await cursor.execute(SQL_SELECT_USER(user))
        
        usuario = await cursor.fetchone()

        if not usuario:
            return None
        
        if not verificar_senha(senha=senha, hash_senha=usuario['senha']):
            return None
        

        return usuario


async def get_usuario_autenticado(conn = Depends(object_postgres.get_connection), token: str = Depends(oauth_schema)):
#     """Função para a verificar o token e informar qual usuário está ativo
#        Parâmetros:[
#         db: AsyncSession ->  sessão da base de dados
#         token: Instancia do OAuth2PasswordBearer
#        ]

#        Retorno:
#         object{usuario} do usuario autorizado

#     """

    credential_exception: HTTPException = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Não foi possível autenticar a credencial",
        headers={"WWW-Authenticate": "Bearer"},
    )


    # decodificação do token acess
    try:
        if token is not None:
            payload = jwt.decode(
                token,
                arq_env.get_env("JWT_SECRET"),
                algorithms=[arq_env.get_env("ALGORITHM")],
                options={"verify_aud": False}
            )

            pessoa_id: str = payload.get("sub")
            if pessoa_id is None:
                raise credential_exception

        else:
            raise credential_exception
    except JWTError:
        raise credential_exception

    # Pesquisa no banco para capturar o dados do usuario
    
    dict_usuario = await getUser(conn=conn, pessoa_id=pessoa_id)

    return dict_usuario