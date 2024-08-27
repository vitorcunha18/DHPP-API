from fastapi import HTTPException, status
from fastapi.responses import JSONResponse

from psycopg_pool import AsyncConnectionPool
from psycopg import errors
from psycopg.rows import dict_row

from ...schema.escrivao.escrivao_schema import EscrivaoCreate

from ...db.sql.escrivao.sql_escrivao_insert import SQL_INSERT_ESCRIVAO
from ...db.sql.escrivao.sql_escrivao_select import SQL_SELECT_ESCRIVAO

from ...db.sql.usuario.sql_usuario_insert import SQL_INSERT_PESSOA, SQL_INSERT_CONTATO, SQL_INSERT_ENDERECO, SQL_INSERT_USUARIO
from ...db.sql.utils.update_generic import SQL_UPDATE_GENERICO


class Escrivao():
     async def create_escrivao(self, user_json_create: EscrivaoCreate, conn: AsyncConnectionPool):
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
                              await cursor.execute(SQL_INSERT_ESCRIVAO(user_json_create.escrivao, pessoa_id))

                         return JSONResponse(status_code=status.HTTP_201_CREATED, content={'message':'Usuário criado com sucesso'})

          except errors.InvalidDatetimeFormat:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

          except errors.UniqueViolation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
          
          except errors.StringDataRightTruncation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

          except Exception as erro:
               print(erro)
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

     async def get_escrivao(self, cpf:str, conn: AsyncConnectionPool): 
          try:
               async with conn.cursor(row_factory=dict_row) as cursor:
               
                    await cursor.execute(SQL_SELECT_ESCRIVAO(cpf))
                    
                    pessoa = await cursor.fetchall()

                    return pessoa
          except Exception as erro:
               pass

          finally:
              await cursor.close()

     async def update_escrivao(self, user_json_update: EscrivaoCreate, conn: AsyncConnectionPool): 
               try:
                    filter_keys = user_json_update.model_dump(exclude_none=True)

                    async with conn.transaction():
                         async with conn.cursor() as cursor:
                              set_pessoa_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.items() if key not in ['usuario', 'endereco', 'contato', 'escrivao']])

                              await cursor.execute(SQL_UPDATE_GENERICO(table="pessoa", usuario=23, dados=set_pessoa_clause, extra="RETURNING CPF"))

                              escrivao_update = await cursor.fetchall()


                              if 'usuario' in filter_keys:
                                   set_usuario_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('usuario', {}).items()])
                                   
                                   await cursor.execute(SQL_UPDATE_GENERICO(table="usuario", usuario=23, dados=set_usuario_clause, fk=True, fk_name="fk_pessoa"))

                              if 'endereco' in filter_keys:
                                   set_endereco_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('endereco', {}).items()])
                                 
                                   await cursor.execute(SQL_UPDATE_GENERICO(table="endereco", usuario=23, dados=set_endereco_clause, fk=True, fk_name="fk_pessoa")) 
                    
                              if 'contato' in filter_keys:
                                   set_contato_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('contato', {}).items()])

                                   await cursor.execute(SQL_UPDATE_GENERICO(table="contato", usuario=23, dados=set_contato_clause, fk=True, fk_name="fk_pessoa"))

                              if 'delegado' in filter_keys:
                                   set_delegado_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('delegado', {}).items()])

                                   await cursor.execute(SQL_UPDATE_GENERICO(table="delegado", usuario=23, dados=set_delegado_clause, fk=True, fk_name="fk_pessoa"))


                              await cursor.execute(SQL_SELECT_ESCRIVAO(escrivao_update[0][0]))
                              
                              pessoa = await self.get_delegado(cpf=escrivao_update[0][0], conn=conn)


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

object_escrivao = Escrivao()