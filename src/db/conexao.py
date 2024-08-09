import os
from contextlib import asynccontextmanager
from fastapi import FastAPI
from psycopg_pool import AsyncConnectionPool

class Postgres():
    def __init__(self):
        self.str_connection = f"""
        dbname={os.getenv('DATABASE_POSTGRES')}
        user={os.getenv('USER_POSTGRES')}
        password={os.getenv('PASSWORD_POSTGRES')}
        host={os.getenv('HOST_POSTGRES')}
        port={os.getenv('PORT_POSTGRES')}
        """

    def get_str_connection(self):
        return self.str_connection
    
    @asynccontextmanager
    async def lifespan(self, app: FastAPI):
        app.async_pool = AsyncConnectionPool(conninfo=self.get_str_connection())
        yield
        await app.async_pool.close()

    

