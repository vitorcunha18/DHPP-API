from fastapi import HTTPException, status
from fastapi.responses import JSONResponse
from itertools import zip_longest

from psycopg_pool import AsyncConnectionPool
from psycopg import errors
from psycopg.rows import dict_row

from ...schema.inquerito.inquerito_schema import InqueritoCreate
from ...schema.usuario.usuario_schema import UsuarioAuth

from ...db.sql.inquerito.sql_inquerito_insert import SQL_INSERT_INQUERITO, SQL_INSERT_ENVOVIDOS_INQUERITO, SQL_INSERT_PROCESSO
from ...db.sql.inquerito.sql_inquerito_select import SQL_SELECT_INQUERITO
from ...db.sql.inquerito.get_inquerito import get_inquerito_dict

from ...db.sql.usuario.sql_usuario_insert import SQL_INSERT_ENDERECO, SQL_INSERT_PESSOA, SQL_INSERT_CONTATO
from ...db.sql.suspeito.sql_suspeito_insert import SQL_INSERT_SUSPEITO
from ...db.sql.vitima.sql_vitima_insert import SQL_INSERT_VITIMA
from ...db.sql.utils.update_generic import SQL_UPDATE_GENERICO


class Inquerito():
     async def create_inquerito(self, inquerito_json_create: InqueritoCreate, user_auth:UsuarioAuth, conn: AsyncConnectionPool):
          try:
               async with conn.transaction():
                    async with conn.cursor() as cursor:
                    
                         await cursor.execute(SQL_INSERT_ENDERECO(dados=inquerito_json_create.endereco_ocorrencia))

                         endereco_id = (await cursor.fetchone())[0]


                         if endereco_id:
                              await cursor.execute(SQL_INSERT_INQUERITO(
                                   dados=inquerito_json_create, 
                                   endereco=endereco_id,
                                   escrivao=user_auth["funcao"]["cod_escrivao"],
                                   cartorio=user_auth["funcao"]["cartorio"]["cod_cartorio"]
                              ))

                              inquerito_id = (await cursor.fetchone())[0]


                         if inquerito_id:
                              if inquerito_json_create.processo:
                                   await cursor.execute(SQL_INSERT_PROCESSO(dados=inquerito_json_create.processo, inquerito=inquerito_id))

                              list_vitima = []
                              list_suspeito = []

                              for suspeito in inquerito_json_create.suspeito:
                                   await cursor.execute(SQL_INSERT_PESSOA(suspeito))

                                   pessoa_id = (await cursor.fetchone())[0]


                                   if pessoa_id:
                                        if suspeito.endereco:
                                             await cursor.execute(SQL_INSERT_ENDERECO(suspeito.endereco, pessoa_id))

                                        if suspeito.contato:
                                             await cursor.execute(SQL_INSERT_CONTATO(suspeito.contato, pessoa_id))

                                        if suspeito.suspeito:
                                             await cursor.execute(SQL_INSERT_SUSPEITO(suspeito.suspeito, pessoa_id))

                                   suspeito_id = (await cursor.fetchone())[0]
                                   
                                  

                                   list_suspeito.append(suspeito_id)
                                   

                              for vitima in inquerito_json_create.vitima:
                                   await cursor.execute(SQL_INSERT_PESSOA(vitima))

                                   pessoa_id = (await cursor.fetchone())[0]

                                   if pessoa_id:
                                        if vitima.endereco:
                                             await cursor.execute(SQL_INSERT_ENDERECO(vitima.endereco, pessoa_id))
                                        if vitima.contato:     
                                             await cursor.execute(SQL_INSERT_CONTATO(vitima.contato, pessoa_id))
                                        if vitima.vitima:
                                             await cursor.execute(SQL_INSERT_VITIMA(vitima.vitima, pessoa_id))

                                   vitima_id = (await cursor.fetchone())[0]
                                   
                                   list_vitima.append(vitima_id)

                              data_envolvidos = [(x, y, inquerito_id) for x, y in zip_longest(list_vitima, list_suspeito)]
                        
               
                              for fk_vitima, fk_suspeito, fk_inquerito in data_envolvidos:
                                   # Consulta de inserção
                                   query = """
                                        INSERT INTO public.envolvidos_inquerito (fk_vitima, fk_suspeito, fk_inquerito)
                                        VALUES (%s, %s, %s)
                                   """
                                   
                                   # Executando a inserção
                                   await cursor.execute(query, (fk_vitima, fk_suspeito, fk_inquerito))


                    return JSONResponse(status_code=status.HTTP_201_CREATED, content={'message':'Inquerito criado com sucesso'})

          except errors.InvalidDatetimeFormat:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

          except errors.UniqueViolation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
          
          except errors.StringDataRightTruncation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

          except Exception as erro:
               print("Erroe",erro)
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

     async def get_inquerito(self, user_auth:UsuarioAuth, conn: AsyncConnectionPool): 
          # try:
               print("print 0")

               return await get_inquerito_dict(conn=conn, user=user_auth)
          # except Exception as erro:
          #      pass

          # finally:
          #     await cursor.close()

     async def update_inquerito(self, user_json_update: create_inquerito, conn: AsyncConnectionPool): 
               try:
                    filter_keys = user_json_update.model_dump(exclude_none=True)

                    async with conn.transaction():
                         async with conn.cursor() as cursor:
                              set_pessoa_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.items() if key not in ['usuario', 'endereco', 'contato']])

                              await cursor.execute(SQL_UPDATE_GENERICO(table="pessoa", usuario=19, dados=set_pessoa_clause, extra="RETURNING CPF"))

                              pessoa_update = await cursor.fetchall()

                              if 'usuario' in filter_keys:
                                   set_usuario_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('usuario', {}).items()])
                                   
                                   await cursor.execute(SQL_UPDATE_GENERICO(table="usuario", usuario=19, dados=set_usuario_clause, fk=True, fk_name="fk_pessoa"))

                              if 'endereco' in filter_keys:
                                   set_endereco_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('endereco', {}).items()])
                                 
                                   await cursor.execute(SQL_UPDATE_GENERICO(table="endereco", usuario=19, dados=set_endereco_clause, fk=True, fk_name="fk_pessoa")) 
                    
                              if 'contato' in filter_keys:
                                   set_contato_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('contato', {}).items()])

                                   await cursor.execute(SQL_UPDATE_GENERICO(table="contato", usuario=19, dados=set_contato_clause, fk=True, fk_name="fk_pessoa"))


                              await cursor.execute(SQL_SELECT_PESSOA(pessoa_update[0][0]))
                              
                              pessoa = await self.get_usuario(cpf=pessoa_update[0][0], conn=conn)

                    return pessoa

               except errors.InvalidDatetimeFormat:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

               except errors.UniqueViolation:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
               
               except errors.StringDataRightTruncation:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

               except Exception as erro:
                    return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

               finally:
                    await cursor.close()

object_inquerito = Inquerito()