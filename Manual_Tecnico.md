# Manual Técnico

Se identificaron las siguientes tablas con sus respectivos atributos

| **Tabla**           | **Atributos**                                                                                       |
|---------------------|-----------------------------------------------------------------------------------------------------|
| **Usuario**         | IdUsuario(PK), Identificacion_Nacional, Nombre, Apellido, Email, Telefono, Estado, FechaRegistro, EmailConfirmado, Direcciones, Metodos_Pagos, created_at, updated_at |
| **Direccion**       | IdDireccion(PK), IdUsuario(FK), Direccion, created_at, updated_at                                   |
| **Trabajador**      | Id_Trabajador, Identificacion_Nacional, Nombre, Apellido, Cargo, Departamento, Sede_Id, Telefono, CorreoInstitucional, Activo, IdSede, created_at, updated_at |
| **Sede**            | IdSede, Nombre, created_at, updated_at                                                             |
| **Producto**        | IdProducto(PK), Sku, Nombre, Descripcion, Precio, Slug, Cantidad, Categoria, Estado, created_at, updated_at |
| **ImagenProducto**  | IdImagen(PK), IdProducto(FK), UrlImagen, created_at, updated_at                                    |
| **Inventario**      | IdProducto(FK), Id_Location, Cantidad, created_at, updated_at                                      |
| **Orden**           | IdOrden(PK), FechaCreacion, IdUsuario(FK), DireccionEnvio, MetodoPago, EstadoOrden, MontoTotal, created_at, updated_at |
| **DetalleOrden**    | IdDetalleOrden(PK), IdOrden(FK), IdProducto(FK), Cantidad, PrecioUnitario, created_at, updated_at  |
| **Pago**            | IdPago(PK), IdOrden(FK), FechaTransaccion, Monto, MetodoPago, EstadoPago, created_at, updated_at   |
| **Envio**           | IdEnvio, IdOrden, FechaDespacho, DireccionEntrega, EmpresaTransporte, NumeroSeguimiento, EstadoEnvio, created_at, updated_at |
| **Devolucion**      | IdDevolucion(PK), IdOrden(FK), IdProducto(FK), FechaSolicitud, Motivo, EstadoDevolucion, created_at, updated_at |
| **Traslado**        | IdTraslado(PK), FechaMovimiento, IdSedeOrigen(FK), IdSedeDestino(FK), EstadoTraslado, FechaEstimada, created_at, updated_at |
| **DetalleTraslado** | IdDetalleTraslado(PK), IdTraslado(FK), IdProducto(FK), CantidadTransferida, created_at, updated_at |

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
