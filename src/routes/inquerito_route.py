
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.inquerito.inqueritoController import object_inquerito
from ..schema.inquerito.inquerito_schema import InqueritoCreate
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres


router_inquerito = APIRouter()

# Criação de usuario
@router_inquerito.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar Usuário")
async def post_usuario(inquerito: InqueritoCreate = Depends(Mid_uppercase_dependency(InqueritoCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de usuário"""
    
    return await object_inquerito.create_inquerito(inquerito_json_create=inquerito, conn=conn)


# @router_inquerito.get("/", status_code=status.HTTP_200_OK, name="Buscar Usuário", response_model=list[UsuarioResponse])
# async def get_usuario(cpf:str, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
#     """Endpoint para buscar usuário"""
    
#     return await object_usuario.get_usuario(cpf=cpf, conn=conn)


# @router_inquerito.put("/", status_code=status.HTTP_200_OK, name="Editar Usuário", response_model=list[UsuarioResponse])
# async def get_usuario(usuario: UsuarioUpdate = Depends(Mid_uppercase_dependency(UsuarioUpdate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
#     """Endpoint para editar usuário"""

#     return await object_usuario.update_usuario(user_json_update=usuario, conn=conn)



