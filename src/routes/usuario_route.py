
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.usuario.usuarioController import object_usuario
from ..schema.usuario.usuario_schema import UsuarioCreate 

from ..db import object_postgres


router_usuario = APIRouter()

# Criação de usuario
@router_usuario.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar Usuário")
async def post_usuario(usuario: UsuarioCreate, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de usuário"""
    
    await object_usuario.create_usuario(user_json_create=usuario, conn=conn)

    return {'tudo certo': ''}

@router_usuario.get("/", status_code=status.HTTP_200_OK, name="Buscar Usuário")
async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de usuário"""
    
    await object_usuario.get_usuario(cpf=cpf, conn=conn)

    return {'tudo certo': ''}

        
