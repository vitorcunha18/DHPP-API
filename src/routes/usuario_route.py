
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.usuario.usuarioController import object_usuario
from ..schema.usuario.usuario_schema import UsuarioCreate, UsuarioResponse, UsuarioUpdate
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres

from ..auth.auth import get_usuario_autenticado

router_usuario = APIRouter()

# Criação de usuario
@router_usuario.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar Usuário")
async def post_usuario(usuario: UsuarioCreate = Depends(Mid_uppercase_dependency(UsuarioCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de usuário"""
    
    return await object_usuario.create_usuario(user_json_create=usuario, conn=conn)


@router_usuario.get("/", status_code=status.HTTP_200_OK, name="Buscar Usuário")
async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para buscar usuário"""
    
    return await object_usuario.get_usuario(cpf=cpf, conn=conn)


@router_usuario.put("/", status_code=status.HTTP_200_OK, name="Editar Usuário", response_model=list[UsuarioResponse])
async def get_usuario(usuario: UsuarioUpdate = Depends(Mid_uppercase_dependency(UsuarioUpdate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para editar usuário"""

    return await object_usuario.update_usuario(user_json_update=usuario, conn=conn)



