from pydantic import BaseModel, Field
from typing import Literal, Optional

from ..usuario.usuario_schema import UsuarioCreate, UsuarioResponse, UsuarioUpdate
from ..endereco.endereco_schema import Endereco

class Escrivao(BaseModel):
    cartorio: Optional[str]= Field(None, example="01")

class EscrivaoCreate(UsuarioCreate):
    escrivao: Optional[Escrivao]

class EscrivaoResponse(UsuarioResponse, Escrivao):
    pass

class EscrivaoUpdate(UsuarioUpdate):
    cartorio: Optional[Escrivao]
