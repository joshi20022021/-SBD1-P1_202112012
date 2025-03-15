import os
import cx_Oracle
import pandas as pd
from db_connection import get_connection

csv_file = "/home/joshipanda2002/Descargas/P1_SBD1_202112012/csv/clientes.csv" 

df = pd.read_csv(csv_file)

conn = get_connection()
cursor = conn.cursor()

insert_query = """
INSERT INTO Usuarios (Id_Usuario, Identificacion_Nacional, Nombre, Apellido, Telefono, Email, Activo, Correo_Confirmado, Contraseña, created_at, updated_at)
VALUES (:1, :2, :3, :4, :5, :6, :7, :8, :9, TO_TIMESTAMP(:10, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:11, 'YYYY-MM-DD HH24:MI:SS.FF6'))
"""

for _, row in df.iterrows():
    cursor.execute(insert_query, tuple(row))

conn.commit()

print("✅ Datos de Usuarios insertados correctamente.")

cursor.close()
conn.close()
