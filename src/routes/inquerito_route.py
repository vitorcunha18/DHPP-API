
from fastapi import APIRouter, Depends, Header
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.inquerito.inqueritoController import object_inquerito
from ..schema.inquerito.inquerito_schema import InqueritoCreate, InqueritoUpdate
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres

from ..schema.usuario.usuario_schema import UsuarioResponse, UsuarioAuth


from ..auth.auth import get_usuario_autenticado

router_inquerito = APIRouter()

# Criação de usuario
@router_inquerito.post("/", name="Cadastrar Inquerito")
async def post_inquerito(inquerito: InqueritoCreate = Depends(Mid_uppercase_dependency(InqueritoCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado:UsuarioAuth = Depends(get_usuario_autenticado)):
    """Endpoint para criação de usuário"""
    
    return await object_inquerito.create_inquerito(inquerito_json_create=inquerito, conn=conn, user_auth=usuario_logado)


@router_inquerito.get("/", status_code=status.HTTP_200_OK, name="Buscar Inquerito")
async def get_inquerito(conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado:UsuarioAuth = Depends(get_usuario_autenticado)):
    """Endpoint para buscar inqueritos"""
    
    return await object_inquerito.get_inquerito(user_auth=usuario_logado, conn=conn)

@router_inquerito.get("/inquerito_unique", status_code=status.HTTP_200_OK, name="Buscar Inquerito")
async def get_inquerito_unique(inquerito:str = Header(), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado:UsuarioAuth = Depends(get_usuario_autenticado)):
    """Endpoint para buscar inqueritos"""
    
    return await object_inquerito.get_inquerito_unique(inquerito=inquerito, user_auth=usuario_logado, conn=conn)

@router_inquerito.get("/inquerito_vitimas", status_code=status.HTTP_200_OK, name="Buscar Inquerito")
async def get_inquerito_unique(inquerito:str = Header(), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado:UsuarioAuth = Depends(get_usuario_autenticado)):
    """Endpoint para buscar vitimas do inquerito"""
    
    return await object_inquerito.get_inquerito_vitima_list(inquerito=inquerito, user_auth=usuario_logado, conn=conn)


@router_inquerito.put("/", status_code=status.HTTP_200_OK, name="Editar Inquerito")
async def get_update_inquerito(inquerito:str = Header(), json_data: InqueritoUpdate = Depends(Mid_uppercase_dependency(InqueritoUpdate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado:UsuarioAuth = Depends(get_usuario_autenticado)):
    """Endpoint para update usuário"""

    return await object_inquerito.update_inquerito(id_inquerito=inquerito, user_inquerito_update=json_data, usuario_logado=usuario_logado, conn=conn)



