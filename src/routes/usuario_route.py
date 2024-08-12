from pydantic import ValidationError
from fastapi import APIRouter, Header
from fastapi import Depends, Request
from fastapi import status
from typing import Dict


from ..controller.usuario.usuarioController import object_usuario

from ..schema.usuario.usuario_schema import usuarioCreate 

router_usuario = APIRouter()

# Criação de usuario
@router_usuario.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar Usuário")
def post_usuario(usuario: usuarioCreate):
    """Endpoint para criação de usuário"""
    
    object_usuario.create_usuario(user_json_create=usuario)

    return {'tudo certo': ''}

        
