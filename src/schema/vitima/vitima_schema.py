from pydantic import BaseModel, Field
from typing import Literal, Optional

from ..pessoa.pessoa_schema import Pessoa
from ..endereco.endereco_schema import Endereco
from ..contato.contato_schema import Contato


class Vitima(BaseModel):
    faccao: Optional[str]= Field(None, example="DIEINA")
    vulgo: Optional[str]= Field(None, example="JEBBFS")
    

class VitimaCreate(Pessoa):
    endereco: Optional[Endereco]
    contato: Optional[Contato]
    vitima: Optional[Vitima]


class VitimaResponse(Vitima, Endereco, Contato, Pessoa):
    pass

class VitimaUpdate(Vitima, Endereco, Contato, Pessoa):
    pass
