from pydantic import BaseModel, Field
from typing import Literal, Optional

from ..pessoa.pessoa_schema import Pessoa
from ..endereco.endereco_schema import Endereco
from ..contato.contato_schema import Contato


class Vitima(BaseModel):
    faccao: Optional[str]= Field(None, example="DIEINA")
    vulgo: Optional[str]= Field(None, example="JEBBFS")
    

class VitimaCreate(Pessoa):
    endereco: Optional[Endereco]= None
    contato: Optional[Contato]= None
    vitima: Optional[Vitima] = None


class VitimaResponse(Vitima, Endereco, Contato, Pessoa):
    pass

class VitimaUpdate(Vitima, Endereco, Contato, Pessoa):
    pass
