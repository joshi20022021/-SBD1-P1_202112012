import cx_Oracle
import pandas as pd
from db_connection import get_connection

conn = get_connection()
cursor = conn.cursor()

df = pd.read_csv("csv/direcciones.csv")
df.columns = df.columns.str.strip()

print("Columnas en el DataFrame:", df.columns.tolist())

columnas_csv = ["id", "client_id", "address", "created_at", "updated_at"]
df.columns = columnas_csv

insert_query = """
    INSERT INTO Direccion (Id_Direccion, Usuarios_Id_Usuario, Address, created_at, updated_at)
    VALUES (:1, :2, :3, TO_TIMESTAMP(:4, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:5, 'YYYY-MM-DD HH24:MI:SS.FF6'))
"""

for _, row in df.iterrows():
    cursor.execute(insert_query, tuple(row))

conn.commit()
cursor.close()
conn.close()

print("Carga de direcciones completada con éxito.")
