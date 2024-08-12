from pydantic import BaseModel, Field
from typing import Literal, Optional

class Contato(BaseModel):
    celular: Optional[str]= Field("")
    telefone: Optional[str] = Field("")
    email: Optional[str]= Field("")

