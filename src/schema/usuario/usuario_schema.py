from pydantic import BaseModel
from datetime import datetime, date
from typing import Dict, List, Optional, Union

from ..pessoa.pessoa_schema import Pessoa, PessoaResponse
from ..endereco.endereco_schema import Endereco
from ..contato.contato_schema import Contato


class Usuario(BaseModel):
    usuario: str
    senha: str    

class UsuarioCreate(Pessoa):
    usuario: str
    senha: str    

    endereco: Optional[Endereco]
    contato: Optional[Contato]


class UsuarioResponse(PessoaResponse):
    usuario: Optional[str]
    senha: Optional[str]

    endereco: Optional[Endereco]
    contato: Optional[Contato]


