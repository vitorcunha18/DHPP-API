from pydantic import BaseModel, Field
from typing import Literal, Optional

class Contato(BaseModel):
    celular: Optional[str]= Field(None, example="00000000000")
    telefone: Optional[str] = Field(None, example="0000000000")
    email: Optional[str]= Field(None, example="BEUF.UBWIBFWDF@EMAIL.COM")

