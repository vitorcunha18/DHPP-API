from fastapi import APIRouter
from src.routes import usuario_route, delegado_route, escrivao_route

index_router = APIRouter()


index_router.include_router(
    usuario_route.router_usuario, prefix="/usuario", tags=["Usuário"]
)

index_router.include_router(
    delegado_route.router_delegado, prefix="/delegado", tags=["Delegado"]
)

index_router.include_router(
    escrivao_route.router_escrivao, prefix="/escrivao", tags=["Escrivão"]
)