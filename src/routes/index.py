from fastapi import APIRouter
from src.routes import usuario_route, delegado_route, escrivao_route, cartorio_route, vitima_route, suspeito_route, inquerito_route

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

index_router.include_router(
    cartorio_route.router_cartorio, prefix="/cartorio", tags=["Cartorio"]
)

index_router.include_router(
    vitima_route.router_vitima, prefix="/vitima", tags=["Vitima"]
)

index_router.include_router(
    suspeito_route.router_suspeito, prefix="/suspeito", tags=["Suspeito"]
)

index_router.include_router(
    inquerito_route.router_inquerito, prefix="/inquerito", tags=["Inquerito"]
)