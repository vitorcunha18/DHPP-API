
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.escrivao.escrivaoController import object_escrivao
from ..schema.escrivao.escrivao_schema import EscrivaoCreate, EscrivaoResponse
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres
from ..schema.usuario.usuario_schema import UsuarioResponse
from ..auth.auth import get_usuario_autenticado


router_escrivao = APIRouter()

# Criação de Escrivão
@router_escrivao.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar escrivão")
async def post_escrivao(usuario: EscrivaoCreate = Depends(Mid_uppercase_dependency(EscrivaoCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de escrivão"""
    
    return await object_escrivao.create_escrivao(user_json_create=usuario, conn=conn)


# buscar Escrivão
@router_escrivao.get("/", status_code=status.HTTP_200_OK, name="Buscar escrivão", response_model=list[EscrivaoResponse])
async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para buscar escrivao"""
    
    return await object_escrivao.get_escrivao(cpf=cpf, conn=conn)
    
# Editar de usuario
@router_escrivao.put("/", status_code=status.HTTP_201_CREATED, name="Cadastrar escrivão")
async def put_escrivao(usuario: EscrivaoCreate = Depends(Mid_uppercase_dependency(EscrivaoCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para editar de escrivão"""
    
    return await object_escrivao.update_escrivao(user_json_create=usuario, conn=conn)

