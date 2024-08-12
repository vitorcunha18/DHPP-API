import os
from contextlib import asynccontextmanager
from fastapi import FastAPI
from psycopg_pool import AsyncConnectionPool

from functools import lru_cache

import psycopg
from psycopg_pool import ConnectionPool, AsyncConnectionPool

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
    

    def get_conn(self):
        return psycopg.connect(conninfo=self.str_connection)


    @lru_cache()
    def get_pool(self):
        return ConnectionPool(conninfo=self.str_connection)


    @lru_cache()
    def get_async_pool(self):
        return AsyncConnectionPool(conninfo=self.str_connection)


object_postgres = Postgres()




