import cx_Oracle
import pandas as pd
from db_connection import get_connection

conn = get_connection()
cursor = conn.cursor()

csv_path = "/home/joshipanda2002/Descargas/P1_SBD1_202112012/csv/movimientos_productos.csv"
df = pd.read_csv(csv_path)

df.columns = ["Id_DetalleTraslado", "Traslados_Id_Traslado", "Productos_Id_Producto", "Cantidad", "created_at", "updated_at"]

df["created_at"] = pd.to_datetime(df["created_at"], errors="coerce")
df["updated_at"] = pd.to_datetime(df["updated_at"], errors="coerce")

if df["created_at"].isnull().any() or df["updated_at"].isnull().any():
    print("Error: Hay fechas inválidas en el CSV.")
    print(df[df["created_at"].isnull() | df["updated_at"].isnull()])
    exit()

insert_query = """
    INSERT INTO Detalle_Traslados (Id_DetalleTraslado, Traslados_Id_Traslado, Productos_Id_Producto, Cantidad, created_at, updated_at)
    VALUES (:1, :2, :3, :4, TO_TIMESTAMP(:5, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:6, 'YYYY-MM-DD HH24:MI:SS.FF6'))
"""

for _, row in df.iterrows():
    try:
        cursor.execute(insert_query, (row["Id_DetalleTraslado"], row["Traslados_Id_Traslado"], row["Productos_Id_Producto"], row["Cantidad"], row["created_at"], row["updated_at"]))
    except cx_Oracle.IntegrityError as e:
        print(f"Error de integridad al insertar ID {row['Id_DetalleTraslado']}: {e}")

conn.commit()
cursor.close()
conn.close()

print("Carga de Detalle_Traslados completada con éxito.")
