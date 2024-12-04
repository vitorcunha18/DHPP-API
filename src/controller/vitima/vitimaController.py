from fastapi import HTTPException, status
from fastapi.responses import JSONResponse

from psycopg_pool import AsyncConnectionPool
from psycopg import errors
from psycopg.rows import dict_row

from ...schema.vitima.vitima_schema import VitimaCreate

from ...db.sql.vitima.sql_vitima_insert import SQL_INSERT_VITIMA
from ...db.sql.vitima.sql_vitima_select import SQL_SELECT_VITIMA_UNIQUE
from ...db.sql.vitima.get_vitima import get_vitima_dict

from ...db.sql.usuario.sql_usuario_insert import SQL_INSERT_PESSOA, SQL_INSERT_CONTATO, SQL_INSERT_ENDERECO
from ...db.sql.utils.update_generic import SQL_UPDATE_GENERICO


class Vitima():
     async def create_vitima(self, user_json_create: VitimaCreate, conn: AsyncConnectionPool):
          pessoa_id = 0
          try:
               async with conn.transaction():
                    async with conn.cursor() as cursor:
                    
                         await cursor.execute(SQL_INSERT_PESSOA(user_json_create))

                         pessoa_id = (await cursor.fetchone())[0]

                         if pessoa_id:
                              await cursor.execute(SQL_INSERT_ENDERECO(user_json_create.endereco, pessoa_id))
                              await cursor.execute(SQL_INSERT_CONTATO(user_json_create.contato, pessoa_id))
                              await cursor.execute(SQL_INSERT_VITIMA(user_json_create.vitima, pessoa_id))

                         return JSONResponse(status_code=status.HTTP_201_CREATED, content={'message':'Vitima criado com sucesso'})

          except errors.InvalidDatetimeFormat:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

          except errors.UniqueViolation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
          
          except errors.StringDataRightTruncation:
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

          except Exception as erro:
               print(erro)
               return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

     async def get_vitima(self, cpf_vitima:str, id_vitima:str, conn: AsyncConnectionPool): 
          if not id_vitima and not cpf_vitima:
               raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail={'message':"É necessário fornecer 'id' ou 'cpf'"})
          
          if id_vitima and cpf_vitima:
               raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail={'message':"Envie apenas 'id' ou 'cpf', não ambos."})
    
          print(cpf_vitima, id_vitima)

          try: 
               # async with conn.cursor(row_factory=dict_row) as cursor:
                    if id_vitima:
                         # Lógica para buscar o usuário pelo id
                         # await cursor.execute(SQL_SELECT_VITIMA_UNIQUE(id=id_vitima))
                        pessoa = await get_vitima_dict(conn=conn, user=id_vitima, unique=True)
                    
                    if cpf_vitima:
                         # Lógica para buscar o usuário pelo cpf
                         # await cursor.execute(SQL_SELECT_VITIMA_UNIQUE(cpf=cpf_vitima))
                        pessoa = await get_vitima_dict(conn=conn, cpf=cpf_vitima, unique=True)

                    # pessoa = await cursor.fetchall()

                    return pessoa

          except Exception as erro:
               pass

     async def update_vitima(self, id_vitima, cpf_vitima,user_json_update, conn: AsyncConnectionPool): 
               if not id_vitima and not cpf_vitima:
                    raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail={'message':"É necessário fornecer 'id' ou 'cpf'"})
          
               if id_vitima and cpf_vitima:
                    raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail={'message':"Envie apenas 'id' ou 'cpf', não ambos."})

               # try:
               filter_keys = user_json_update.model_dump(exclude_none=True)

               async with conn.transaction():
                    async with conn.cursor() as cursor:
                         set_pessoa_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.items() if key not in ['endereco', 'contato', 'vitima']])

                         if id_vitima:
                              # Lógica para buscar o usuário pelo id
                              await cursor.execute(SQL_UPDATE_GENERICO(table="pessoa", fk=True, fk_name="pessoa_id", usuario=id_vitima, dados=set_pessoa_clause, extra="RETURNING pessoa_id"))
                         
                         if cpf_vitima:
                              # Lógica para buscar o usuário pelo cpf
                              await cursor.execute(SQL_UPDATE_GENERICO(table="pessoa", fk=True, fk_name="cpf", usuario=f"'{cpf_vitima}'", dados=set_pessoa_clause, extra="RETURNING pessoa_id"))

                         pessoa_update = await cursor.fetchone()


                         print("updatde", pessoa_update[0])

                         if 'endereco' in filter_keys:
                              set_endereco_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('endereco', {}).items()])

                              await cursor.execute(SQL_UPDATE_GENERICO(table="endereco", usuario=f"'{pessoa_update[0]}'", dados=set_endereco_clause, fk=True, fk_name="fk_pessoa")) 
               
                         if 'contato' in filter_keys:
                              set_contato_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('contato', {}).items()])

                              await cursor.execute(SQL_UPDATE_GENERICO(table="contato", usuario=f"'{pessoa_update[0]}'", dados=set_contato_clause, fk=True, fk_name="fk_pessoa"))

                         if 'vitima' in filter_keys:
                              set_vitima_clause = ", ".join([f"{key} = '{value}'" for key, value in filter_keys.get('vitima', {}).items()])

                              await cursor.execute(SQL_UPDATE_GENERICO(table="vitima", usuario=f"'{pessoa_update[0]}'", dados=set_vitima_clause, fk=True, fk_name="fk_pessoa"))


                         # await cursor.execute(SQL_SELECT_VITIMA_UNIQUE(cpf=pessoa_update[0][0]))
                         # pessoa = await self.get_vitima(cpf=pessoa_update[0][0], conn=conn)
                         


               return {'messa': 'certo'}

               # except errors.InvalidDatetimeFormat:
               #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'As datas não atendem'})

               # except errors.UniqueViolation:
               #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Um dos valores já existe'}) 
               
               # except errors.StringDataRightTruncation:
               #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Limite do dado '})

               # except Exception as erro:
               #      print(erro)
               #      return HTTPException(status_code=status.HTTP_422_UNPROCESSABLE_ENTITY, detail={'message':'Erro genérico'})

               # finally:
               #      await cursor.close()

object_vitima = Vitima()