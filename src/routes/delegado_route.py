
from fastapi import APIRouter, Depends
from fastapi import status
from psycopg_pool import AsyncConnectionPool
from fastapi import HTTPException

from ..controller.usuario.usuarioController import object_usuario
from ..schema.usuario.usuario_schema import UsuarioCreate 

from ..db import object_postgres


router_delegado = APIRouter()

# Criação de usuario
@router_delegado.post("/", status_code=status.HTTP_201_CREATED, name="Cadastrar Delegado")
async def post_delegado(usuario: UsuarioCreate, conn:AsyncConnectionPool = Depends(object_postgres.get_connection)):
    """Endpoint para criação de usuário"""
    
    await object_usuario.create_usuario(user_json_create=usuario, conn=conn)

    return {'tudo certo': ''}

        
