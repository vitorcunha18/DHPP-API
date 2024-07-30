from dotenv import load_dotenv, find_dotenv
import os

class Env():
    def __init__(self) -> None:
        load_dotenv(find_dotenv())

    def get_env(self, nome_chave:str):
        self.nome = nome_chave.upper()
        return os.getenv(self.nome)


arq_env = Env()
