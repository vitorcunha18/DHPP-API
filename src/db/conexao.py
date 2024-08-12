import os
from psycopg_pool import AsyncConnectionPool

class Postgres:
    def __init__(self):
        self.str_connection = f"""user={os.getenv('USER_POSTGRES')} password={os.getenv('PASSWORD_POSTGRES')} host={os.getenv('HOST_POSTGRES')} port={os.getenv('PORT_POSTGRES')} dbname={os.getenv('DATABASE_POSTGRES')}"""

    def get_str_connection(self):
        return self.str_connection

    async def open_pool(self):
        await self.pool.open()

    async def close_pool(self):
        await self.pool.close()


    async def get_connection(self):
        self.pool = AsyncConnectionPool(conninfo=self.str_connection)
        async with self.pool.connection() as conn:
            yield conn





