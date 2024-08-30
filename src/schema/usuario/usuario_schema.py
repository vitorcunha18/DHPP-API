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


# Create
class UsuarioCreate(Pessoa):
    usuario: Optional[Usuario]
    endereco: Optional[Endereco]
    contato: Optional[Contato]

# Response
class UsuarioResponse(Endereco, Contato, PessoaResponse):
    usuario: Optional[str] = None

# Update
class UsuarioUpdate(BaseModel): 
    senha: Optional[str] = Field(None, example="BEUFUBWIBFWDF") 

class UsuarioUpdate(PessoaUpdate):
    usuario: Optional[UsuarioUpdate] = None
    endereco: Optional[Endereco] = None
    contato: Optional[Contato] = None


