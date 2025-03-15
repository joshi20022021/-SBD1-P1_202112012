import cx_Oracle
import pandas as pd

dsn_tns = cx_Oracle.makedsn("localhost", 1521, service_name="XEPDB1")
conn = cx_Oracle.connect(user="SYSTEM", password="oracle", dsn=dsn_tns)
cursor = conn.cursor()

df = pd.read_csv("csv/productos.csv")
df.columns = df.columns.str.strip()

print("Columnas en el DataFrame:", df.columns.tolist())

columnas_csv = ["id", "sku", "name", "description", "price", "slug", "category_id", "active", "created_at", "updated_at"]
df.columns = columnas_csv

df["active"] = df["active"].map({True: 1, False: 0})

df["price"] = df["price"].astype(float)
df["category_id"] = df["category_id"].astype(int)

insert_query = """
    INSERT INTO Productos (Id_Producto, SKu, Nombre, Descripcion, Precio, Slug, Categoria_Id_Categoria, Activo, created_at, updated_at)
    VALUES (:1, :2, :3, :4, :5, :6, :7, :8, TO_TIMESTAMP(:9, 'YYYY-MM-DD HH24:MI:SS.FF6'), TO_TIMESTAMP(:10, 'YYYY-MM-DD HH24:MI:SS.FF6'))
"""

for _, row in df.iterrows():
    cursor.execute(insert_query, tuple(row))

conn.commit()
cursor.close()
conn.close()

print("Carga de productos completada con éxito.")
