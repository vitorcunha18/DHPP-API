
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.delegado.delegadoController import object_delegado
from ..schema.delegado.delegado_schema import DelegadoCreate, DelegadoResponse, DelegadoUpdate

from ..db import object_postgres


router_delegado = APIRouter()

# Criação de usuario
@router_delegado.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar Delegado")
async def post_delegado(usuario: DelegadoCreate, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação do delegado"""

    return await object_delegado.create_delegado(user_json_create=usuario, conn=conn)

        
@router_delegado.get("/", status_code=status.HTTP_200_OK, name="Buscar Delegado", response_model=list[DelegadoResponse])
async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para buscar delegado"""
    
    return await object_delegado.get_delegado(cpf=cpf, conn=conn)


@router_delegado.put("/", status_code=status.HTTP_200_OK, name="Editar Delegado", response_model=list[DelegadoResponse])
async def get_usuario(usuario: DelegadoUpdate, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para editar delegado"""

    return await object_delegado.update_delegado(user_json_update=usuario, conn=conn)