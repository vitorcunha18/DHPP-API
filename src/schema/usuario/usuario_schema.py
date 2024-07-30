from pydantic import BaseModel
from datetime import datetime, date
from typing import Dict, List, Optional, Union

class UsuarioSchema(BaseModel):
    nome:str 
    matricula:str 
    cpf:str 
    nascimento: date
    sexo:str 
    status:int

