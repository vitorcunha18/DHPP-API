from pydantic import BaseModel, Field
from typing import Literal, Optional

from ..usuario.usuario_schema import UsuarioCreate, UsuarioResponse, UsuarioUpdate
from ..endereco.endereco_schema import Endereco


class Investigador(UsuarioCreate):
    equipe: Optional[str]= Field(None, example="01")

class InvestigadorResponse(Investigador):
    equipeo_id: Optional[int] 


class InvestigadorUpdate(UsuarioUpdate):
    cartorio: Optional[Investigador]
