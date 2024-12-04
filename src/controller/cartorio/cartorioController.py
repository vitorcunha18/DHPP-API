from fastapi import HTTPException, status
from fastapi.responses import JSONResponse

from psycopg_pool import AsyncConnectionPool
from psycopg import errors
from psycopg.rows import dict_row

from ...schema.cartorio.cartorio_schema import CartorioCreate

from ...db.sql.cartorio.sql_cartorio import SQL_INSERT_CARTORIO, SQL_SELECT_CARTORIO_ALL, SQL_SELECT_CARTORIO, SQL_UPDATE_CARTORIO

class Cartorio():
     async def get_cartorio(self, codigo, conn: AsyncConnectionPool): 
          try:
               async with conn.cursor(row_factory=dict_row) as cursor:
               
                    await cursor.execute(SQL_SELECT_CARTORIO(codigo=codigo))
                    
                    cartorio = await cursor.fetchone()

                    return cartorio
               
          except Exception as erro:
               pass

          finally:
              await cursor.close()

     async def create_cartorio(self, cartorio_json_create: CartorioCreate, conn: AsyncConnectionPool):
          try:
               async with conn.transaction():
                    async with conn.cursor() as cursor:
                    
                         await cursor.execute(SQL_INSERT_CARTORIO(cartorio_json_create))

                         return JSONResponse(status_code=status.HTTP_201_CREATED, content={'message':'Cartório criado com sucesso'})

          except errors.UniqueViolation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
          
          except errors.StringDataRightTruncation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

          except Exception as erro:
               print(erro)
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

     async def get_cartorioALL(self,  conn: AsyncConnectionPool): 
          try:
               async with conn.cursor(row_factory=dict_row) as cursor:
               
                    await cursor.execute(SQL_SELECT_CARTORIO_ALL())
                    
                    pessoa = await cursor.fetchall()

                    return pessoa
          except Exception as erro:
               pass

          finally:
              await cursor.close()

     async def update_cartorio(self, codigo:str, cartorio_json_create: CartorioCreate, conn: AsyncConnectionPool): 
               try:
                    filter_keys = cartorio_json_create.model_dump(exclude_none=True)

                    if 'n_responsavel' in filter_keys:
                         filter_keys['fk_delegado'] = filter_keys.pop('n_responsavel')

                    async with conn.transaction():
                         async with conn.cursor() as cursor:
                              set_cartorio_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.items()])

                              await cursor.execute(SQL_UPDATE_CARTORIO(dados=set_cartorio_clause,codigo=codigo))

                              cartorio_update = await self.get_cartorio(codigo=codigo, conn=conn)

                    return cartorio_update
               
               except errors.UniqueViolation:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
               
               except errors.StringDataRightTruncation:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

               except Exception as erro:
                    print(erro)
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

               finally:
                    await cursor.close()

object_Cartorio = Cartorio()