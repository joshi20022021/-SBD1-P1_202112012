import cx_Oracle
import pandas as pd
from db_connection import get_connection

csv_file = "/home/joshipanda2002/Descargas/P1_SBD1_202112012/csv/categorias.csv"
df = pd.read_csv(csv_file)

conn = get_connection()
cursor = conn.cursor()

insert_query = """
INSERT INTO Categoria (Id_Categoria, Nombre, created_at, updated_at)
VALUES (:1, :2, TO_TIMESTAMP(:3, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:4, 'YYYY-MM-DD HH24:MI:SS.FF6'))
"""

for _, row in df.iterrows():
    cursor.execute(insert_query, tuple(row))

conn.commit()

print("Categorías insertadas correctamente.")

cursor.close()
conn.close()
