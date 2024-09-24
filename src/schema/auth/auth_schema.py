from pydantic import BaseModel, Field
from datetime import datetime, date
from typing import Dict, List, Optional, Union

from ..pessoa.pessoa_schema import Pessoa, PessoaResponse, PessoaUpdate
from ..endereco.endereco_schema import Endereco
from ..contato.contato_schema import Contato

# Base
class Usuario(BaseModel):
    usuario: str = Field(None, example="BEUFUBWIBFWDF") 
    senha: str = Field(None, example="BEUFUBWIBFWDF") 

class EscrivaoUserResponse(BaseModel):
    cod_cartorio: Optional[int] = None
    nome_cartorio:  Optional[str] = None
    responsavel_cartorio:  Optional[str]= None

class DelegadoUserResponse(BaseModel):
    cod_cartorio:   Optional[int] = None
    nome_cartorio:  Optional[str]= None

class Cargo(BaseModel):
    nome_cargo: Optional[str] = None
    cartorio: Union[EscrivaoUserResponse, List[DelegadoUserResponse]] = None

class UsuarioAuth(PessoaResponse):
    usuario: Optional[Usuario] = None
    funcao: Optional[Cargo] = None



