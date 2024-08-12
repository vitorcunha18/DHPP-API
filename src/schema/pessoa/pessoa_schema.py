from pydantic import BaseModel
from datetime import datetime, date
from typing import Dict, List, Optional, Union

class Pessoa(BaseModel):
    nome: str
    nome_social: str 
    nascimento: date
    cpf:str 
    sexo:str 
    etnia: str
    identidade_genero: str
    pdc: str

