from pydantic import BaseModel, Field
from typing import Literal, Optional

from ..pessoa.pessoa_schema import Pessoa
from ..endereco.endereco_schema import Endereco
from ..contato.contato_schema import Contato


class Suspeito(BaseModel):
    faccao: Optional[str]= Field(None, example="DIEINA")
    vulgo: Optional[str]= Field(None, example="JEBBFS")
    
class SuspeitoCreate(Pessoa):
    endereco: Optional[Endereco] = None
    contato: Optional[Contato] = None
    suspeito: Optional[Suspeito] = None

class SuspeitoResponse(Suspeito, Endereco, Contato, Pessoa):
    pass

class SuspeitoUpdate(Suspeito, Endereco, Contato, Pessoa):
    pass
