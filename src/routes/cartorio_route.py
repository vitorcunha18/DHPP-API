from fastapi import APIRouter, Depends, Header, Request
from fastapi import status
from psycopg_pool import AsyncConnectionPool


from ..controller.cartorio.cartorioController import object_Cartorio
from ..schema.cartorio.cartorio_schema import CartorioCreate 
from ..middlewares.upper_case import Mid_uppercase_dependency
from ..db import object_postgres

from ..schema.usuario.usuario_schema import UsuarioResponse
from ..auth.auth import get_usuario_autenticado

router_cartorio = APIRouter()

# Criação de usuario
@router_cartorio.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar cartorio")
async def post_cartorio(cartorio: CartorioCreate = Depends(Mid_uppercase_dependency(CartorioCreate)), conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de cartorio"""

    return await object_Cartorio.create_cartorio(cartorio_json_create=cartorio, conn=conn)

# Buscar de usuario
@router_cartorio.get("/", status_code=status.HTTP_201_CREATED, name="Buscar cartorio")
async def post_cartorio( conn:AsyncConnectionPool = Depends(object_postgres.get_connection), usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para buscar de cartorio"""

    return await object_Cartorio.get_cartorioALL( conn=conn)

# Edição de usuario
@router_cartorio.put("/", status_code=status.HTTP_201_CREATED, name="Editar cartorio")
async def put_cartorio(
                       codigo:str, 
                       cartorio: CartorioCreate, 
                       conn:AsyncConnectionPool = Depends(object_postgres.get_connection),
                       usuario_logado: UsuarioResponse = Depends(get_usuario_autenticado)):
    """Endpoint para editar de cartorio"""

    return await object_Cartorio.update_cartorio(cartorio_json_create=cartorio, codigo=codigo ,conn=conn)

        
