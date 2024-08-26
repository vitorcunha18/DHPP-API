
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.escrivao.escrivaoController import object_escrivao
from ..schema.escrivao.escrivao_schema import EscrivaoCreate, EscrivaoResponse

from ..db import object_postgres


router_escrivao = APIRouter()

# Criação de usuario
@router_escrivao.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar escrivão")
async def post_escrivao(usuario: EscrivaoCreate, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de escrivão"""
    
    return await object_escrivao.create_escrivao(user_json_create=usuario, conn=conn)


        
@router_escrivao.get("/", status_code=status.HTTP_200_OK, name="Buscar Delegado", response_model=list[EscrivaoResponse])
async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para buscar escrivao"""
    
    return await object_escrivao.get_escrivao(cpf=cpf, conn=conn)
