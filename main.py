from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware


from src.doc.informações_geral import informacao_api
from src.utils.env import arq_env
from src.routes.index import index_router

app = FastAPI(
    title=informacao_api['titulo_api'],
    description=informacao_api['descrição'],
    version=informacao_api['version_numero'],
)
  
origins = [
    "http://localhost:3000",  # Domínio local de front-end (React, Angular, etc.)
    "*"                      # Permite todos os domínios (não recomendado para produção)
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,            # Lista de origens permitidas
    allow_credentials=True,           # Permite envio de cookies e headers de autenticação
    allow_methods=["*"],              # Permite todos os métodos (GET, POST, PUT, DELETE, etc.)
    allow_headers=["*"],              # Permite todos os headers
)

app.include_router(index_router, prefix=informacao_api["version_prefix"])

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8000, log_level="info", reload=True)
    
    # uvicorn.run("main:app", host="127.0.0.1", port=8000, log_level="info", reload=True)
