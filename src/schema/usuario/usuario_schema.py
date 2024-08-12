from pydantic import BaseModel
from datetime import datetime, date
from typing import Dict, List, Optional, Union

from ..pessoa.pessoa_schema import Pessoa
class usuarioCreate(Pessoa):
    usuario: str
    senha: str    

