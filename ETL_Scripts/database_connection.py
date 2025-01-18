import oracledb
def db_connect(db_name,password,service_name):
     ''' this function establish the connection between python and oracle database 
     and return the databse connection cursor'''
     connection = oracledb.connect(user=db_name, password=password, dsn=f"127.0.0.1:1521/{service_name}")
     cursor = connection.cursor()
     return cursor