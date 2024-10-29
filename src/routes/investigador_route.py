
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.investigador.investigadorController import object_investigador
from ..schema.investigador.investigador_schema import Investigador, InvestigadorResponse
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres
from ..schema.usuario.usuario_schema import UsuarioResponse
from ..auth.auth import get_usuario_autenticado


router_investigador = APIRouter()

# Criação de Escrivão
@router_investigador.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar escrivão")
async def post_escrivao(usuario: Investigador = Depends(Mid_uppercase_dependency(Investigador)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de Investigador"""
    
    return await object_investigador.create_investigador(investigador_json_create=usuario, conn=conn)


# Buscar equipes
@router_investigador.get("/equipes", status_code=status.HTTP_200_OK, name="Buscar Equipes")
async def get_usuario( conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para buscar escrivao"""
    
    return await object_investigador.get_equipes(conn=conn)
    
# # Editar de usuario
# @router_escrivao.put("/", status_code=status.HTTP_201_CREATED, name="Cadastrar escrivão")
# async def put_escrivao(usuario: EscrivaoCreate = Depends(Mid_uppercase_dependency(EscrivaoCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
#     """Endpoint para editar de escrivão"""
    
#     return await object_investigador.update_escrivao(user_json_create=usuario, conn=conn)

