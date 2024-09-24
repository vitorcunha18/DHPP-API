from pydantic import BaseModel, Field
from datetime import datetime, date
from typing import Dict, List, Optional, Union

from ..pessoa.pessoa_schema import Pessoa, PessoaResponse, PessoaUpdate, PessoaAuth
from ..endereco.endereco_schema import Endereco
from ..contato.contato_schema import Contato

# Base
class Usuario(BaseModel):
    usuario: str = Field(None, example="BEUFUBWIBFWDF") 
    senha: str = Field(None, example="BEUFUBWIBFWDF") 


# Create
class UsuarioCreate(Pessoa):
    usuario: Optional[Usuario]
    endereco: Optional[Endereco]
    contato: Optional[Contato]

# Response
class Usuario(BaseModel):
    usuario: Optional[str] = None
    


class EscrivaoUserResponse(BaseModel):
    cod_cartorio: Optional[int] = None
    nome_cartorio:  Optional[str] = None
    responsavel_cartorio:  Optional[str]= None

class DelegadoUserResponse(BaseModel):
    cod_cartorio:   Optional[int] = None
    nome_cartorio:  Optional[str]= None

class Cargo(BaseModel):
    nome_cargo: Optional[str] = None
    cod_escrivao: Optional[int] = None
    cartorio: Union[EscrivaoUserResponse, List[DelegadoUserResponse]] = None

class UsuarioResponse(BaseModel):
    pessoa: Optional[PessoaResponse] = None
    endereco: Optional[Endereco] = None
    contato: Optional[Contato]  = None
    usuario: Optional[Usuario] = None
    funcao: Optional[Cargo] = None
    
# Update
class UsuarioUpdate(BaseModel): 
    senha: Optional[str] = Field(None, example="BEUFUBWIBFWDF") 

class UsuarioUpdate(PessoaUpdate):
    usuario: Optional[UsuarioUpdate] = None
    endereco: Optional[Endereco] = None
    contato: Optional[Contato] = None


# Auth
class Usuario(BaseModel):
    id: Optional[int] = None
    usuario: Optional[str] = None

class UsuarioAuth(PessoaAuth):
    usuario: Optional[Usuario] = None
    funcao: Optional[Cargo] = None
