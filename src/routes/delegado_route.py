
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.delegado.delegadoController import object_delegado
from ..schema.delegado.delegado_schema import DelegadoCreate, DelegadoResponse, DelegadoUpdate
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres

from ..schema.usuario.usuario_schema import UsuarioResponse
from ..auth.auth import get_usuario_autenticado

router_delegado = APIRouter()

# Criação de usuario
@router_delegado.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar Delegado")
async def post_delegado(usuario: DelegadoCreate = Depends(Mid_uppercase_dependency(DelegadoCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para criação do delegado"""

    return await object_delegado.create_delegado(user_json_create=usuario, conn=conn)

        
@router_delegado.get("/", status_code=status.HTTP_200_OK, name="Buscar Delegado", response_model=list[DelegadoResponse])
async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para buscar delegado"""
    
    return await object_delegado.get_delegado(cpf=cpf, conn=conn)


@router_delegado.put("/", status_code=status.HTTP_200_OK, name="Editar Delegado", response_model=list[DelegadoResponse])
async def get_usuario(usuario: DelegadoUpdate = Depends(Mid_uppercase_dependency(DelegadoUpdate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para editar delegado"""

    return await object_delegado.update_delegado(user_json_update=usuario, conn=conn)