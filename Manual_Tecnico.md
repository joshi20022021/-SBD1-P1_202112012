# Manual Técnico

Se identificaron las siguientes tablas con sus respectivos atributos.

| #  | Entidad       | Atributos                                                                 |
|----|-------------|---------------------------------------------------------------------------|
| 1  | Usuarios    | id, identificacion_nacional, nombre, apellido, correo_electronico, numero_telefono, activo, fecha_registro, correo_confirmado, direcciones, metodos_pago_preferidos, created_at, updated_at |
| 2  | Trabajadores | id, identificacion_nacional, nombre, apellido, cargo, departamento, numero_telefono, correo_institucional, sede_asignada, activo, created_at, updated_at |
| 3  | Productos   | id, sku, nombre, descripcion, precio, slug, cantidad_inventario_por_sede, categoria, activo, imagenes_asociadas, created_at, updated_at |
| 4  | Órdenes     | id, fecha_creacion, id_cliente, lista_productos, cantidades_y_precios_unitarios, created_at, updated_at |
| 5  | Pagos       | id, id_orden_compra, fecha_transaccion, monto_total, metodo_pago, estado_pago, created_at, updated_at |
| 6  | Envíos      | id, fecha_despacho, id_orden_compra, direccion_entrega, empresa_transporte, numero_seguimiento, estado_envio, created_at, updated_at |
| 7  | Devoluciones | id, id_orden_compra, fecha_solicitud, motivo_devolucion, estado_devolucion, producto_relacionado, created_at, updated_at |
| 8  | Traslados   | id, fecha_movimiento, almacen_origen, almacen_destino, lista_productos_trasladados, cantidad_transferida, estado_traslado, fecha_estimada_llegada, created_at, updated_at |

Posteriormente se realizo la normalizacion de las tablas desde la forma 1FN hasta la forma 3FN de la base de datos asi como de sus relaciones entre cada tabla, la destruccion de las relaciones muchos a muchos de ciertas entidades. para obtener finalmente la base de datos normalizada la cual es la siguiente:

| #  | Entidad             | Atributos                                                                                                                                                                           |
|----|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1  | Categoria           | Id_Categoria, Nombre, created_at, updated_at                                                                                                                                        |
| 2  | Departamento        | Id_Departamento, Nombre, created_at, updated_at                                                                                                                                       |
| 3  | Detalle_Orden       | Id_Detalle, Productos_Id_Producto, Ordenes_Id_Orden, Total, Precio, created_at, updated_at                                                                                            |
| 4  | Detalle_Traslados   | Id_Traslado, Cantidad, created_at, updated_at, Traslados_Id_Traslado, Productos_Id_Producto                                                                                           |
| 5  | Devoluciones        | Id_Devolucion, Fecha_Solicitud, Motivo, Estado, created_at, updated_at, Ordenes_Id_Orden, Productos_Id_Producto                                                                      |
| 6  | Direccion           | Id_Direccion, Address, created_at, updated_at, Usuarios_Id_Usuario                                                                                                                    |
| 7  | Envios              | Id_Envio, Fecha_Despacho, Compania, NumeroEnvio, Estado, created_at, updated_at, Ordenes_Id_Orden, Direccion_Usuarios_Id_Usuario, Direccion_Id_Direccion                                |
| 8  | ImagenProducto      | Id_Imagen, UrlImagen, created_at, updated_at, Productos_Id_Producto                                                                                                                   |
| 9  | Inventario          | Id_Inventario, Cantidad, created_at, updated_at, Sede_Id_Sede, Productos_Id_Producto                                                                                                  |
| 10 | Metodo_Pago         | Id_MetodoPago, Tipo_Pago, Detalles_Pago, created_at, updated_at, Usuarios_Id_Usuario                                                                                                  |
| 11 | Ordenes             | Id_Orden, Estado, Pagos_Id_Pago, created_at, updated_at, Sede_Id_Sede, Usuarios_Id_Usuario                                                                                             |
| 12 | Pagos               | Id_Pago, Fecha_Transaccion, Monto, Metodo_Pago, Estado_Pago, created_at, updated_at, Metodo_Pago_Id_MetodoPago                                                                       |
| 13 | Productos           | Id_Producto, Sku, Nombre, Descripcion, Precio, Slug, Activo, created_at, updated_at, Categoria_Id_Categoria                                                                           |
| 14 | Sede                | Id_Sede, Nombre, Ubicacion, created_at, updated_at                                                                                                                                    |
| 15 | Trabajadores        | Id_Trabajador, Identificacion_Nacional, Nombre, Apellido, Cargo, Telefono, Email_Institucional, Activo, created_at, updated_at, Departamento_Id_Departamento, Sede_Id_Sede             |
| 16 | Traslados           | Id_Traslado, Fecha_Movimiento, Origen, Destino, Estado, Fecha_Llegada, created_at, updated_at                                                                                         |
| 17 | Usuarios            | Id_Usuario, Identificacion_Nacional, Nombre, Apellido, Telefono, Email, contraseña, Activo, Correo_Confirmado, created_at, updated_at                                                 |


## Esquema Conceptual
![Descripción de la imagen](https://ibb.co/qMRXFPzg)


## Esquema Lógico


## Esquema Físico


## Fases del proceso de normalización, hasta forma normal 3


## Descripción de las tablas

| Tabla  | Atributo  | Tipo de Dato  | Descripción  |
|--------|----------|--------------|--------------|
|        |          |              |              |

## Descripción de la API



## Descripción de los endpoints utilizados

### Endpoint 1
- **Método:** ``
- **Endpoint:** ``
- **Request:**
```json
{
    
}

{
    
}
