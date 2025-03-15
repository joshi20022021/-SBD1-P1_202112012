import cx_Oracle
import pandas as pd
from db_connection import get_connection

conn = get_connection()
cursor = conn.cursor()

csv_path = "/home/joshipanda2002/Descargas/P1_SBD1_202112012/csv/sedes.csv"
df = pd.read_csv(csv_path)

df.columns = ["Id_Sede", "Nombre", "created_at", "updated_at"]

df["created_at"] = pd.to_datetime(df["created_at"], errors="coerce")
df["updated_at"] = pd.to_datetime(df["updated_at"], errors="coerce")

if df["created_at"].isnull().any() or df["updated_at"].isnull().any():
    print("Error: Hay fechas inválidas en el CSV.")
    print(df[df["created_at"].isnull() | df["updated_at"].isnull()])
    exit()

insert_query = """
    INSERT INTO Sede (Id_Sede, Nombre, created_at, updated_at)
    VALUES (:1, :2, TO_TIMESTAMP(:3, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:4, 'YYYY-MM-DD HH24:MI:SS.FF6'))
"""

for _, row in df.iterrows():
    cursor.execute(insert_query, (row["Id_Sede"], row["Nombre"], row["created_at"], row["updated_at"]))

conn.commit()
cursor.close()
conn.close()

print("Carga de Sede completada con éxito.")
