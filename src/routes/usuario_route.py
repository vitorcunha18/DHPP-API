from pydantic import ValidationError
from fastapi import APIRouter, Header
from fastapi import Depends, Request
from fastapi import status
from typing import Dict

router_usuario = APIRouter()

# Criação de usuario
@router_usuario.get("/", status_code=status.HTTP_201_CREATED, name="Cadastrar Usuário")
async def post_usuario(request: Request):
    """Endpoint para criação de usuário"""
    

    return {'tudo certo': ''}

        
