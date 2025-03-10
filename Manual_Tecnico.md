# Manual Técnico

Se identificaron las siguientes tablas con sus respectivos atributos.

| #  | Entidad              | Atributos                                                                                                                                                                                                 |
|----|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1  | usuarios             | id, identificacion_nacional, nombre, apellido, email, telefono, activo, fecha_registro, confirmo_correo, **direcciones**, **metodos_pago**, created_at, updated_at                                      |
| 2  | trabajadores         | id, identificacion_nacional, nombre, apellido, cargo, departamento, telefono, correo_institucional, **sede_asignada**, activo, created_at, updated_at                                                   |
| 3  | productos            | id, sku, nombre, descripcion, precio, slug, **categoria**, **imagenes**, **inventario_por_sede**, activo, created_at, updated_at                                                                        |
| 4  | ordenes              | id, fecha_creacion, usuario_id, **lista_productos** (producto_id, cantidad, precio_unitario), created_at, updated_at                                                                                   |
| 5  | pagos                | id, orden_id, fecha_transaccion, monto_total, metodo_pago (tarjeta, transferencia, etc.), estado (pendiente/aprobado/rechazado), created_at, updated_at                                                 |
| 6  | envios               | id, fecha_despacho, orden_id, direccion_entrega, **empresa_transporte**, numero_seguimiento, estado (en tránsito/entregado/devuelto), created_at, updated_at                                             |
| 7  | devoluciones         | id, orden_id, producto_id, fecha_solicitud, motivo, estado (en revisión/aprobada/rechazada), created_at, updated_at                                                                                     |
| 8  | traslados            | id, fecha_movimiento, almacen_origen, almacen_destino, **lista_productos** (producto_id, cantidad), estado, fecha_estimada_llegada, created_at, updated_at                                              |


Posteriormente se realizo la normalizacion de las tablas desde la forma 1FN hasta la forma 3FN de la base de datos asi como de sus relaciones entre cada tabla, la destruccion de las relaciones muchos a muchos de ciertas entidades.

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
