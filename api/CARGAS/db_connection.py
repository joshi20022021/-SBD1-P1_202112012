import cx_Oracle

dsn_tns = cx_Oracle.makedsn("localhost", 1521, service_name="XEPDB1")
conn = cx_Oracle.connect(user="SYSTEM", password="oracle", dsn=dsn_tns)

def get_connection():
    return conn
