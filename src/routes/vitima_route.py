
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.vitima.vitimaController import object_vitima
from ..schema.vitima.vitima_schema import VitimaCreate, VitimaUpdate, VitimaResponse
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres

from ..schema.usuario.usuario_schema import UsuarioResponse
from ..auth.auth import get_usuario_autenticado

router_vitima = APIRouter()

# Criação de usuario
@router_vitima.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar vitima")
async def post_usuario(usuario: VitimaCreate = Depends(Mid_uppercase_dependency(VitimaCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para criação de vitima"""
    
    return await object_vitima.create_vitima(user_json_create=usuario, conn=conn)


@router_vitima.get("/", status_code=status.HTTP_200_OK, name="Buscar vitima", response_model=list[VitimaResponse])
async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para buscar vitima"""
    
    return await object_vitima.get_vitima(cpf=cpf, conn=conn)


@router_vitima.put("/", status_code=status.HTTP_200_OK, name="Editar vitima", response_model=list[VitimaCreate])
async def get_usuario(usuario: VitimaCreate = Depends(Mid_uppercase_dependency(VitimaCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para editar vitima"""

    return await object_vitima.update_vitima(user_json_update=usuario, conn=conn)



