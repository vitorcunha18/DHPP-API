from pydantic import BaseModel, Field
from typing import Literal, Optional


class Cartorio(BaseModel):
    nome: Optional[str]= Field(None, example="LALSDENE")
    n_responsavel: Optional[str]= Field(None, example="01")
    

class CartorioCreate(Cartorio):
    pass


class CartorioUpdate(Cartorio):
    escrivao: Optional[Cartorio]
