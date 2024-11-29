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
from ...db.sql.inquerito.sql_inquerito_update import SQL_UPDATE_INQUERITO
from ...db.sql.inquerito.get_inquerito import get_inquerito_dict
from ...db.sql.vitima.get_vitima import get_vitima_dict


from ...db.sql.utils.update_endereco import SQL_UPDATE_ENDERECO

from ...db.sql.usuario.sql_usuario_insert import SQL_INSERT_ENDERECO, SQL_INSERT_PESSOA, SQL_INSERT_CONTATO
from ...db.sql.suspeito.sql_suspeito_insert import SQL_INSERT_SUSPEITO
from ...db.sql.vitima.sql_vitima_insert import SQL_INSERT_VITIMA
from ...db.sql.utils.update_generic import SQL_UPDATE_GENERICO


class Inquerito():
     async def create_inquerito(self, inquerito_json_create: InqueritoCreate, user_auth:UsuarioAuth, conn: AsyncConnectionPool):
          # try:
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

          # except errors.InvalidDatetimeFormat:
          #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

          # except errors.UniqueViolation:
          #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
          
          # except errors.StringDataRightTruncation:
          #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

          # except Exception as erro:
          #      print("Erroe", erro)
          #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

     async def get_inquerito(self, user_auth:UsuarioAuth, conn: AsyncConnectionPool): 
          # try:

               return await get_inquerito_dict(conn=conn, user=user_auth)
          # except Exception as erro:
          #      pass

          # finally:
          #     await cursor.close()
     
     async def get_inquerito_unique(self, inquerito, user_auth:UsuarioAuth, conn: AsyncConnectionPool): 
          # try:

               return await get_inquerito_dict(conn=conn, inquerito=inquerito, unique=True ,user=user_auth)
          # except Exception as erro:
          #      pass

          # finally:
          #     await cursor.close()
     
     async def get_inquerito_vitima_list(self, inquerito, user_auth:UsuarioAuth, conn: AsyncConnectionPool): 
          # try:

               return await get_vitima_dict(conn=conn, inquerito=inquerito, unique=False ,user=user_auth)
          # except Exception as erro:
          #      pass

          # finally:
          #     await cursor.close()

     async def update_inquerito(self, id_inquerito, user_inquerito_update: create_inquerito, usuario_logado, conn: AsyncConnectionPool): 
               # try:
                    filter_keys = user_inquerito_update.model_dump(exclude_none=True)

                    async with conn.transaction():
                         async with conn.cursor() as cursor:
                              # set_inquerito_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.items() if key not in ['endereco_ocorrencia']])

                              set_inquerito_clause = ", ".join([
                                   f"fk_equipe = '{value}'" if key == "equipe_investigadora" else
                                   f"{key} = ARRAY[{', '.join([f'\'{v.lower()}\'' if str(v).lower() == 'false' else f'\'{v}\'' for v in value])}]" if key == "tipificacao" else
                                   f"{key} = '{value}'"
                                   for key, value in filter_keys.items()
                                   if key not in ['endereco_ocorrencia']
                              ])

                              print("clause", set_inquerito_clause)

                              await cursor.execute(SQL_UPDATE_INQUERITO(set_edit=set_inquerito_clause, where_codition=f"inquerito_id = {id_inquerito}", return_data="fk_endereco"))

                              inquerito_db = await cursor.fetchone()

                              if 'endereco_ocorrencia' in filter_keys:
                                   set_endereco_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('endereco_ocorrencia', {}).items()])

                                   await cursor.execute(SQL_UPDATE_ENDERECO(set_edit=set_endereco_clause, where_codition=f"endereco_id = {inquerito_db[0]}")) 


                            

                    return JSONResponse(status_code=status.HTTP_200_OK, content={'message':'Inquerito atualizado com sucesso'})

               # except errors.InvalidDatetimeFormat:
               #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

               # except errors.UniqueViolation:
               #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
               
               # except errors.StringDataRightTruncation:
               #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

               # except Exception as erro:
               #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

               # finally:
               #      await cursor.close()

object_inquerito = Inquerito()