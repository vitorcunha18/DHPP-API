from datetime import datetime, date

def conveter_data(data: date):  
    if str(data) in ":":
        data_nascimento = data
    else: 
        ano, mes, dia = str(data).split('-')[0], str(data).split('-')[1], str(data).split('-')[2]

        data_nascimento = datetime(
            year=int(ano),
            month=int(mes),
            day=int(dia),
            hour=00,
            minute=00,
            second=00
        )

        return data_nascimento
    

