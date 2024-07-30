from fastapi import APIRouter
from src.routes import usuario_route

index_router = APIRouter()


index_router.include_router(
    usuario_route.router_usuario, prefix="/usuario", tags=["Usuário"]
)
