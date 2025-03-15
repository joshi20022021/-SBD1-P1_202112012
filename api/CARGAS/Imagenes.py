import cx_Oracle
import pandas as pd
from db_connection import get_connection

conn = get_connection()
cursor = conn.cursor()

df = pd.read_csv("/home/joshipanda2002/Descargas/P1_SBD1_202112012/csv/imagenes.csv")
df.columns = df.columns.str.strip()

print("Columnas en el DataFrame:", df.columns.tolist())

columnas_csv = ["id", "product_id", "image", "created_at", "updated_at"]
df.columns = columnas_csv

insert_query = """
    INSERT INTO ImagenProducto (Id_Imagen, Productos_Id_Producto, UrlImagen, created_at, updated_at)
    VALUES (:1, :2, :3, TO_TIMESTAMP(:4, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:5, 'YYYY-MM-DD HH24:MI:SS.FF6'))
"""

for _, row in df.iterrows():
    cursor.execute(insert_query, tuple(row))

conn.commit()
cursor.close()
conn.close()

print("Carga de imágenes de productos completada con éxito.")
