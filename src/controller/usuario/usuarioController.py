from fastapi import Request
from ...schema.usuario.usuario_schema import usuarioCreate

from ...db.sql.sql_usuario import SQL_INSERT
from ...db.conexao import object_postgres


pool = object_postgres.get_pool()


class Usuario():
     def create_usuario(self, user_json_create: usuarioCreate):
        try:
             with pool.connection() as conn:
                    conn.execute(SQL_INSERT(user_json_create))
                    conn.commit()
        except Exception:
            conn.rollback()
object_usuario = Usuario()