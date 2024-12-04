from pydantic import BaseModel, Field
from typing import Literal, Optional

class Endereco(BaseModel):
    logradouro: Optional[str]= Field(None, example="RUA JOSE")
    n_residencia: Optional[str] = Field(None, example="00")
    bairro: Optional[str]= Field(None, example="MARIA ALVES")
    cidade: Optional[str]= Field(None, example="RIO BRANCO")
    cep: Optional[str]= Field(None, example="01001000")
    regional: Optional[str]= Field(None, example="PARTE ALTA")
    uf: Optional[Literal[
        's/n',
        'RO',
        'AC',
        'AM',
        'RR',
        'PA',
        'AP',
        'TO',
        'MA',
        'PI',
        'CE',
        'RN',
        'PB',
        'PE',
        'AL',
        'SE',
        'BA',
        'MG',
        'ES',
        'RJ',
        'SP',
        'PR',
        'SC',
        'RS',
        'MS',
        'MT',
        'GO',
        'DF',
    ]] = Field(default="AC", example="AC")

