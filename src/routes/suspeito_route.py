
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.suspeito.suspeitoController import object_suspeito
from ..schema.vitima.vitima_schema import VitimaCreate, VitimaUpdate, VitimaResponse
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres


router_suspeito = APIRouter()

# Criação de usuario
@router_suspeito.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar suspeito")
async def post_usuario(usuario: VitimaCreate = Depends(Mid_uppercase_dependency(VitimaCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de suspeito"""
    
    return await object_suspeito.create_suspeito(user_json_create=usuario, conn=conn)


@router_suspeito.get("/", status_code=status.HTTP_200_OK, name="Buscar suspeito", response_model=list[VitimaResponse])
async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para buscar suspeito"""
    
    return await object_suspeito.get_suspeito(cpf=cpf, conn=conn)


@router_suspeito.put("/", status_code=status.HTTP_200_OK, name="Editar suspeito", response_model=list[VitimaCreate])
async def get_usuario(usuario: VitimaCreate = Depends(Mid_uppercase_dependency(VitimaCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para editar suspeito"""

    return await object_suspeito.update_suspeito(user_json_update=usuario, conn=conn)



