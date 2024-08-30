from fastapi import HTTPException, status
from fastapi.responses import JSONResponse

from psycopg_pool import AsyncConnectionPool
from psycopg import errors
from psycopg.rows import dict_row

from ...schema.vitima.vitima_schema import VitimaCreate

from ...db.sql.suspeito.sql_suspeito_insert import SQL_INSERT_SUSPEITO
from ...db.sql.suspeito.sql_suspeito_select import SQL_SELECT_SUSPEITO

from ...db.sql.usuario.sql_usuario_insert import SQL_INSERT_PESSOA, SQL_INSERT_CONTATO, SQL_INSERT_ENDERECO
from ...db.sql.utils.update_generic import SQL_UPDATE_GENERICO


class Suspeito():
     async def create_suspeito(self, user_json_create: VitimaCreate, conn: AsyncConnectionPool):
          pessoa_id = 0
          try:
               async with conn.transaction():
                    async with conn.cursor() as cursor:
                    
                         await cursor.execute(SQL_INSERT_PESSOA(user_json_create))

                         pessoa_id = (await cursor.fetchone())[0]

                         if pessoa_id:
                              await cursor.execute(SQL_INSERT_ENDERECO(user_json_create.endereco, pessoa_id))
                              await cursor.execute(SQL_INSERT_CONTATO(user_json_create.contato, pessoa_id))
                              await cursor.execute(SQL_INSERT_SUSPEITO(user_json_create.vitima, pessoa_id))

                         return JSONResponse(status_code=status.HTTP_201_CREATED, content={'message':'Suspeito criado com sucesso'})

          except errors.InvalidDatetimeFormat:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

          except errors.UniqueViolation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
          
          except errors.StringDataRightTruncation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

          except Exception as erro:
               print(erro)
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

     async def get_suspeito(self, cpf:str, conn: AsyncConnectionPool): 
          try:
               async with conn.cursor(row_factory=dict_row) as cursor:
               
                    await cursor.execute(SQL_SELECT_SUSPEITO(cpf))
                    
                    pessoa = await cursor.fetchall()

                    return pessoa
          except Exception as erro:
               pass

          finally:
              await cursor.close()

     async def update_suspeito(self, user_json_update, conn: AsyncConnectionPool): 
               try:
                    filter_keys = user_json_update.model_dump(exclude_none=True)

                    async with conn.transaction():
                         async with conn.cursor() as cursor:
                              set_pessoa_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.items() if key not in ['endereco', 'contato', 'vitima']])

                              await cursor.execute(SQL_UPDATE_GENERICO(table="pessoa", usuario=23, dados=set_pessoa_clause, extra="RETURNING CPF"))

                              pessoa_update = await cursor.fetchall()

                              if 'endereco' in filter_keys:
                                   set_endereco_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('endereco', {}).items()])
                                 
                                   await cursor.execute(SQL_UPDATE_GENERICO(table="endereco", usuario=23, dados=set_endereco_clause, fk=True, fk_name="fk_pessoa")) 
                    
                              if 'contato' in filter_keys:
                                   set_contato_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('contato', {}).items()])

                                   await cursor.execute(SQL_UPDATE_GENERICO(table="contato", usuario=23, dados=set_contato_clause, fk=True, fk_name="fk_pessoa"))

                              if 'vitima' in filter_keys:
                                   set_vitima_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('delegado', {}).items()])

                                   await cursor.execute(SQL_UPDATE_GENERICO(table="vitima", usuario=23, dados=set_vitima_clause, fk=True, fk_name="fk_pessoa"))


                              await cursor.execute(SQL_SELECT_VITIMA(pessoa_update[0][0]))
                              
                              pessoa = await self.get_vitima(cpf=pessoa_update[0][0], conn=conn)


                    return pessoa

               except errors.InvalidDatetimeFormat:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

               except errors.UniqueViolation:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
               
               except errors.StringDataRightTruncation:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

               except Exception as erro:
                    print(erro)
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

               finally:
                    await cursor.close()

object_suspeito = Suspeito()