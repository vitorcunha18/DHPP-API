from ..schema.usuario.usuario_schema import UsuarioUpdate

def Mid_uppercase_dependency(schema):
    def _uppercase_dependency(data: schema) -> schema:
        data_dict = data.dict()
        for key, value in data_dict.items():
            if isinstance(value, str):
                data_dict[key] = value.upper()
        return schema(**data_dict)
    return _uppercase_dependency