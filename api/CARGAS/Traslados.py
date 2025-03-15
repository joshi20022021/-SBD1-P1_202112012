import cx_Oracle
import pandas as pd
from db_connection import get_connection

conn = get_connection()
cursor = conn.cursor()

csv_path = "/home/joshipanda2002/Descargas/P1_SBD1_202112012/csv/movimientos.csv"
df = pd.read_csv(csv_path)

df.columns = ["Id_Traslado", "Origen", "Destino", "Estado", "Fecha_Llegada", "Fecha_Movimiento", "created_at", "updated_at"]

df["Fecha_Llegada"] = pd.to_datetime(df["Fecha_Llegada"], errors="coerce")
df["Fecha_Movimiento"] = pd.to_datetime(df["Fecha_Movimiento"], errors="coerce")
df["created_at"] = pd.to_datetime(df["created_at"], errors="coerce")
df["updated_at"] = pd.to_datetime(df["updated_at"], errors="coerce")

if df.isnull().any().any():
    print("Error: Hay fechas inválidas en el CSV.")
    print(df[df.isnull().any(axis=1)])
    exit()

insert_query = """
    INSERT INTO Traslados (Id_Traslado, Origen, Destino, Estado, Fecha_Llegada, Fecha_Movimiento, created_at, updated_at)
    VALUES (:1, :2, :3, :4, TO_TIMESTAMP(:5, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:6, 'YYYY-MM-DD HH24:MI:SS.FF6'), 
            TO_TIMESTAMP(:7, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:8, 'YYYY-MM-DD HH24:MI:SS.FF6'))
"""

for _, row in df.iterrows():
    cursor.execute(insert_query, (
        row["Id_Traslado"], row["Origen"], row["Destino"], row["Estado"],
        row["Fecha_Llegada"], row["Fecha_Movimiento"], row["created_at"], row["updated_at"]
    ))

conn.commit()
cursor.close()
conn.close()

print("Carga de Traslados completada con éxito.")
