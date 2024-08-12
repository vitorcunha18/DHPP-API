from pydantic import BaseModel, Field
from typing import Literal, Optional

class Endereco(BaseModel):
    logradouro: Optional[str]= Field("")
    n_residencia: Optional[str] = Field("")
    bairro: Optional[str]= Field("")
    cidade: Optional[str]= Field("")
    cep: Optional[str]= Field("")
    uf: Optional[str]= Field(..., example="AC")

