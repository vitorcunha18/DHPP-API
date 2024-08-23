from pydantic import BaseModel, Field
from datetime import datetime, date
from typing import Literal, Optional

# Base
class Pessoa(BaseModel):
    nome: str = Field(None, example="BEUF") 
    nome_social: Optional[str] = Field(None, example="UBWIBFWDF") 
    nascimento: Optional[date] = Field()
    cpf: Optional[str] = Field(None,example="00011122204") 
    sexo: Literal['F','M'] = Field(..., title="Sexo do Usuário", example="[F, M]")
    etnia: Optional[str] = Field(None,example="SDFHUSDF")
    identidade_genero: Optional[str]= Field(None, example="SDFSDF")
    pdc: Optional[str] = Field(None, example="DASDQEWES")
    
# Response
class PessoaResponse(BaseModel):
    nome: Optional[str] = None
    nome_social: Optional[str] = None
    nascimento: Optional[date] = None
    cpf: Optional[str] = None
    sexo: Optional[str] = None
    etnia: Optional[str] = None
    identidade_genero: Optional[str] = None
    pdc: Optional[str] = None

# Update
class PessoaUpdate(BaseModel):
    nome: Optional[str] = Field(None, example="BEUF") 
    nome_social: Optional[str] = Field(None, example="UBWIBFWDF") 
    nascimento: Optional[date] = Field(None)
    sexo: Optional[Literal['F','M']] = Field(None, example="[F, M]")
    etnia: Optional[str] = Field(None,example="SDFHUSDF")
    identidade_genero: Optional[str]= Field(None, example="SDFSDF")
    pdc: Optional[str] = Field(None, example="DASDQEWES")