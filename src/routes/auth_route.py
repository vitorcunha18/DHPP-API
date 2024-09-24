from fastapi import APIRouter, HTTPException
from fastapi import Depends, Request
from fastapi import status
from fastapi import Header
from fastapi.responses import JSONResponse
from fastapi.security import OAuth2PasswordRequestForm
from pydantic import ValidationError
from typing import Optional

# Schema
from ..schema.usuario.usuario_schema import UsuarioResponse, UsuarioAuth

# Dependenca
from ..db import object_postgres

# Auth
from ..auth.auth import autenticar, get_usuario_autenticado
from ..auth.token import criar_token_acesso


from pytz import timezone
import datetime as dt


router_auth = APIRouter()

@router_auth.post('/login', name="Autenticar")
async def usuario_autenticar(form_data: OAuth2PasswordRequestForm = Depends(), session = Depends(object_postgres.get_connection)):
    """Endpoint para a autenticação de usuário

       Parâmetros: [
        form_data: OAuth2PasswordRequestForm = Form data da request
        session: AsyncSession
       ]

       Retorno:[
        object {access_token}
       ]
    """

    usuario = await autenticar(user=form_data.username, senha=form_data.password, conn=session)

    if not usuario:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail={"message": "Usuário não encontrado. Verifique os parâmetros fornecidos."}
        )
    

    # configurando o acesso
    TOKEN = criar_token_acesso(sub=usuario['pessoa_id'])

    return JSONResponse(content={"access_token": TOKEN, "token_type": "bearer"}, status_code=status.HTTP_200_OK)


@router_auth.get('/logado', name="Autenticado", response_model=UsuarioAuth)
def usuario_autenticado(usuario_logado:UsuarioAuth = Depends(get_usuario_autenticado)):
    """Endpoint para verificar o usuário autorizado"""
    
    return usuario_logado

