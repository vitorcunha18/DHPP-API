from pydantic import BaseModel, Field
from datetime import datetime, date
from typing import Literal, Optional

class Pessoa(BaseModel):
    nome: str = Field("")
    nome_social: Optional[str] = Field("") 
    nascimento: Optional[str] = Field("")
    cpf: Optional[str] = Field("") 
    sexo: Literal['F','M'] = Field(..., title="Sexo do Usuário", example="F")
    etnia: Optional[str] = Field("")
    identidade_genero: Optional[str]= Field("")
    pdc: Optional[str] = Field("", example="")
    
class PessoaResponse(BaseModel):
    nome: str
    nome_social: str
    nascimento: str
    cpf: str 
    sexo: str
    etnia: str
    identidade_genero: str
    pdc: str

