INSERT INTO Categoria (IdCategoria, Nombre, created_at, updated_at)
VALUES (1, 'Electrónica', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));
INSERT INTO Categoria (IdCategoria, Nombre, created_at, updated_at)
VALUES (2, 'Ropa', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));

INSERT INTO Departamento (IdDepartamento, Nombre, created_at, updated_at)
VALUES (1, 'Ventas', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));
INSERT INTO Departamento (IdDepartamento, Nombre, created_at, updated_at)
VALUES (2, 'Soporte', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));

INSERT INTO Sede (IdSede, Nombre, Ubicacion, created_at, updated_at)
VALUES (1, 'Sede Central', 'Ciudad Principal', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));
INSERT INTO Sede (IdSede, Nombre, Ubicacion, created_at, updated_at)
VALUES (2, 'Sede Norte', 'Ciudad Norte', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));

INSERT INTO Usuarios (Id_Usuario, Identificacion_Nacional, Nombre, Apellido, Telefono, Email, Activo, FechaRegistro, Correo_Confirmado, Direccion)
VALUES (1, '123456789', 'Juan', 'Perez', '5551234', 'juan@example.com', 'Y', TO_DATE('2025-03-09','YYYY-MM-DD'), 'Y', 'Calle 1');
INSERT INTO Usuarios (Id_Usuario, Identificacion_Nacional, Nombre, Apellido, Telefono, Email, Activo, FechaRegistro, Correo_Confirmado, Direccion)
VALUES (2, '987654321', 'Maria', 'Lopez', '5555678', 'maria@example.com', 'Y', TO_DATE('2025-03-09','YYYY-MM-DD'), 'Y', 'Calle 2');

INSERT INTO Direccion (IdDireccion, Calle, Usuarios_Id_Usuario, Ciudad, CodigoPostal, created_at, updated_at)
VALUES (1, 'Av. Siempre Viva 123', 1, 'Ciudad Principal', '12345', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));
INSERT INTO Direccion (IdDireccion, Calle, Usuarios_Id_Usuario, Ciudad, CodigoPostal, created_at, updated_at)
VALUES (2, 'Calle Falsa 456', 2, 'Ciudad Norte', '67890', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));

INSERT INTO Metodo_Pago (IdPago, Tipo_Pago, Detalles_Pago, created_at, updated_at, Usuarios_Id_Usuario)
VALUES ('MP01', 'Tarjeta de Credito', 'Visa', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 1);
INSERT INTO Metodo_Pago (IdPago, Tipo_Pago, Detalles_Pago, created_at, updated_at, Usuarios_Id_Usuario)
VALUES ('MP02', 'Paypal', 'Cuenta Paypal', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 2);

INSERT INTO Pagos (Id_Pago, Fecha_Transaccion, Monto, Metodo_Pago, Estado_Pago, created_at, updated_at)
VALUES (1, TO_DATE('2025-03-09','YYYY-MM-DD'), 150.00, 'Tarjeta de Credito', 'Aprobado', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));
INSERT INTO Pagos (Id_Pago, Fecha_Transaccion, Monto, Metodo_Pago, Estado_Pago, created_at, updated_at)
VALUES (2, TO_DATE('2025-03-09','YYYY-MM-DD'), 75.00, 'Paypal', 'Aprobado', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));

INSERT INTO Productos (Id_Producto, Sku, Nombre, Descripcion, Precio, Slug, Activo, created_at, updated_at, Categoria_IdCategoria)
VALUES (1, 'SKU001', 'Smartphone', 'Teléfono inteligente de alta gama', 500.00, 'smartphone', 'Y', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 1);
INSERT INTO Productos (Id_Producto, Sku, Nombre, Descripcion, Precio, Slug, Activo, created_at, updated_at, Categoria_IdCategoria)
VALUES (2, 'SKU002', 'Camiseta', 'Camiseta 100% algodón', 20.00, 'camiseta', 'Y', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 2);

INSERT INTO Envios (Id_Envio, Fecha_Despacho, Direccion, Transporte, NumeroEnvio, Estado, created_at, updated_at, Direccion_IdDireccion)
VALUES (1, TO_DATE('2025-03-09','YYYY-MM-DD'), 'Av. Siempre Viva 123', 'DHL', 'ENV001', 'En Proceso', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 1);
INSERT INTO Envios (Id_Envio, Fecha_Despacho, Direccion, Transporte, NumeroEnvio, Estado, created_at, updated_at, Direccion_IdDireccion)
VALUES (2, TO_DATE('2025-03-10','YYYY-MM-DD'), 'Calle Falsa 456', 'FedEx', 'ENV002', 'Enviado', TO_DATE('2025-03-10','YYYY-MM-DD'), TO_DATE('2025-03-10','YYYY-MM-DD'), 2);

INSERT INTO Ordenes (Id_Orden, Total, Estado, created_at, updated_at, Pagos_Id_Pago, Envios_Id_Envio, Direccion_IdDireccion, Envios_IdDireccion, Usuarios_Id_Usuario)
VALUES (1, '150', 'P', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 1, 1, 1, 1, 1);
INSERT INTO Ordenes (Id_Orden, Total, Estado, created_at, updated_at, Pagos_Id_Pago, Envios_Id_Envio, Direccion_IdDireccion, Envios_IdDireccion, Usuarios_Id_Usuario)
VALUES (2, '75', 'P', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 2, 2, 2, 2, 2);

INSERT INTO ImagenProducto (IdImagen, IdProducto, UrlImagen, created_at, updated_at, Productos_Id_Producto)
VALUES (1, 1, 'http://example.com/smartphone.jpg', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 1);
INSERT INTO ImagenProducto (IdImagen, IdProducto, UrlImagen, created_at, updated_at, Productos_Id_Producto)
VALUES (2, 2, 'http://example.com/camiseta.jpg', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 2);

INSERT INTO Trabajadores (Id_Trabajador, Identificacion_Nacional, Nombre, Apellido, Cargo, Telefono, Email_Institucional, Sede, Activo, created_at, updated_at, Sede_IdSede, Departamento_IdDepartamento)
VALUES (1, '111222333', 'Ana', 'Gomez', 'Vendedora', '5551111', 'ana@example.com', 'Sede Central', 'Y', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 1, 1);
INSERT INTO Trabajadores (Id_Trabajador, Identificacion_Nacional, Nombre, Apellido, Cargo, Telefono, Email_Institucional, Sede, Activo, created_at, updated_at, Sede_IdSede, Departamento_IdDepartamento)
VALUES (2, '444555666', 'Luis', 'Martinez', 'Soporte Técnico', '5552222', 'luis@example.com', 'Sede Norte', 'Y', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 2, 2);

INSERT INTO Traslados (Id_Traslado, Fecha_Movimiento, Origen, Destino, Estado, Fecha_Llegada, created_at, updated_at, Sede_IdSede)
VALUES (1, TO_DATE('2025-03-09','YYYY-MM-DD'), 1, 2, 'Completado', TO_DATE('2025-03-10','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 1);
INSERT INTO Traslados (Id_Traslado, Fecha_Movimiento, Origen, Destino, Estado, Fecha_Llegada, created_at, updated_at, Sede_IdSede)
VALUES (2, TO_DATE('2025-03-10','YYYY-MM-DD'), 2, 1, 'Pendiente', TO_DATE('2025-03-11','YYYY-MM-DD'), TO_DATE('2025-03-10','YYYY-MM-DD'), TO_DATE('2025-03-10','YYYY-MM-DD'), 2);

INSERT INTO Detalle_Orden (Orden_Id, created_at, updated_at, Productos_Id_Producto, Ordenes_Id_Orden, Ordenes_IdDireccion)
VALUES (1, TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 1, 1, 1);
INSERT INTO Detalle_Orden (Orden_Id, created_at, updated_at, Productos_Id_Producto, Ordenes_Id_Orden, Ordenes_IdDireccion)
VALUES (2, TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'), 2, 2, 2);

INSERT INTO Devoluciones (Id_Devolucion, Fecha_Solicitud, Motivo, Estado, created_at, updated_at, Ordenes_Id_Orden, Ordenes_IdDireccion)
VALUES (1, TO_DATE('2025-03-10','YYYY-MM-DD'), 'Producto defectuoso', 'Pendiente', TO_DATE('2025-03-10','YYYY-MM-DD'), TO_DATE('2025-03-10','YYYY-MM-DD'), 1, 1);
INSERT INTO Devoluciones (Id_Devolucion, Fecha_Solicitud, Motivo, Estado, created_at, updated_at, Ordenes_Id_Orden, Ordenes_IdDireccion)
VALUES (2, TO_DATE('2025-03-11','YYYY-MM-DD'), 'No cumple expectativas', 'Pendiente', TO_DATE('2025-03-11','YYYY-MM-DD'), TO_DATE('2025-03-11','YYYY-MM-DD'), 2, 2);

INSERT INTO Detalle_Traslados (Id_Traslado, Traslados_Id_Traslado, Productos_Id_Producto, Cantidad, created_at, updated_at)
VALUES (1, 1, 1, '10', TO_DATE('2025-03-09','YYYY-MM-DD'), TO_DATE('2025-03-09','YYYY-MM-DD'));
INSERT INTO Detalle_Traslados (Id_Traslado, Traslados_Id_Traslado, Productos_Id_Producto, Cantidad, created_at, updated_at)
VALUES (2, 2, 2, '5', TO_DATE('2025-03-10','YYYY-MM-DD'), TO_DATE('2025-03-10','YYYY-MM-DD'));
