from pydantic import BaseModel, Field
from typing import Literal, Optional, List
from datetime import date, datetime

from ..vitima.vitima_schema import VitimaCreate
from ..suspeito.suspeito_schema import SuspeitoCreate
from ..endereco.endereco_schema import Endereco

class EnvolvidosInquerito(BaseModel):
    fk_vitima: Optional[str]
    fk_suspeito: Optional[str]
    fk_inquerito: Optional[str]

class Processo(BaseModel):
    n_processo: Optional[str] = Field(None, example="1923123")
    representacao_juducial: Optional[str] = Field(None, example="ABYUSDNC")
    cumprimento_mandado: Optional[str] = Field(None, example="NAIUGCE")

class Inquerito(BaseModel):
    n_sinesp: Optional[str] = Field(None, example="DIEINA")
    n_ip: Optional[str] = Field(None, example="JEBBFS")
    tipo_ip: Optional[str] = Field(None, example="JEBBFS")
    tipo_portaria: Optional[str] = Field(None, example="JEBBFS")
    tipificacao: List[str] = Field(None, example="JEBBFS")
    data_instauracao: Optional[datetime] = Field()
    data_ocorrencia: Optional[datetime] = Field()
    equipe_investigadora: Optional[str] = Field(None, example="1")
    periodo_ocorrencia: Optional[str] = Field(None, example="MANHA")
    
class InqueritoCreate(Inquerito):
    processo: Optional[Processo] = None
    endereco_ocorrencia: Optional[Endereco]
    vitima: Optional[List[VitimaCreate]] = None
    suspeito: Optional[List[SuspeitoCreate]] = None
     

