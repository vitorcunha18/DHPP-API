from pydantic import BaseModel, Field
from typing import Literal, Optional

from ..usuario.usuario_schema import UsuarioCreate, UsuarioResponse, UsuarioUpdate
from ..endereco.endereco_schema import Endereco

class Delegado(BaseModel):
    oab: Optional[str]= Field(None, example="00000000000")

class DelegadoCreate(UsuarioCreate):
    delegado: Optional[Delegado]

class DelegadoResponse(UsuarioResponse, Delegado):
    pass


class DelegadoUpdate(UsuarioUpdate):
    delegado: Optional[Delegado]
