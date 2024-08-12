from fastapi import HTTPException, status
from fastapi.responses import JSONResponse

from psycopg_pool import AsyncConnectionPool
from psycopg import errors
from psycopg.rows import class_row

from ...schema.usuario.usuario_schema import UsuarioCreate, UsuarioResponse

from ...db.sql.usuario.sql_usuario_insert import SQL_INSERT_PESSOA, SQL_INSERT_CONTATO, SQL_INSERT_ENDERECO, SQL_INSERT_USUARIO
from ...db.sql.usuario.sql_usuario_select import SQL_SELECT_PESSOA

class Usuario():
     async def create_usuario(self, user_json_create: UsuarioCreate, conn: AsyncConnectionPool):
          pessoa_id = 0
          try:
               async with conn.transaction():
                    async with conn.cursor() as cursor:
                        
                         await cursor.execute(SQL_INSERT_PESSOA(user_json_create))

                         pessoa_id = (await cursor.fetchone())[0]

                         if pessoa_id:
                              await cursor.execute(SQL_INSERT_ENDERECO(user_json_create.endereco, pessoa_id))
                              await cursor.execute(SQL_INSERT_CONTATO(user_json_create.contato, pessoa_id))
                              await cursor.execute(SQL_INSERT_USUARIO(user_json_create.usuario, pessoa_id))
          except errors.InvalidDatetimeFormat:
               HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})
          except errors.InvalidDatetimeFormat:
               HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})


          except Exception as erro:
               print(erro)
               raise

     async def get_usuario(self, cpf:str, conn: AsyncConnectionPool): 
          try:
               async with conn.cursor(row_factory=class_row(UsuarioResponse)) as cursor:
               
                    await cursor.execute(SQL_SELECT_PESSOA(cpf))
                    
                    pessoa = await cursor.fetchone()

                    print("abyusdy",pessoa)

          except Exception as erro:
               print(erro)

          finally:
              await cursor.close()
              await conn.close()

object_usuario = Usuario()