--1. Creacion tabla Categoria
CREATE TABLE Categoria (
    Id_Categoria NUMBER PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

--2. Creacion tabla Departamento
CREATE TABLE Departamento (
    Id_Departamento NUMBER PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP
);

--3. Creacion tabla detalle_orden
CREATE TABLE Detalle_Orden
(
    Id_Detalle INTEGER PRIMARY KEY,
    Productos_Id_Producto INTEGER NOT NULL,
    Ordenes_Id_Orden INTEGER NOT NULL,
    Total NUMBER(10,2) NOT NULL,
    Precio NUMBER(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP, 
    CONSTRAINT fk_DetalleOrden_Producto FOREIGN KEY (Productos_Id_Producto)
         REFERENCES Productos(Id_Producto),
    CONSTRAINT fk_DetalleOrden_Orden FOREIGN KEY (Ordenes_Id_Orden)
         REFERENCES Ordenes(Id_Orden)
);

--4. Creacion tabla detalle_traslados
CREATE TABLE Detalle_Traslados (
    Id_DetalleTraslado NUMBER PRIMARY KEY,
    Productos_Id_Producto NUMBER NOT NULL,
    Traslados_Id_Traslado NUMBER NOT NULL,
    Cantidad NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_DetalleTraslados_Producto FOREIGN KEY (Productos_Id_Producto)
         REFERENCES Productos(Id_Producto),
    CONSTRAINT fk_DetalleTraslados_Traslado FOREIGN KEY (Traslados_Id_Traslado)
         REFERENCES Traslados(Id_Traslado)
);


--5. creacion tabla devoluciones
CREATE TABLE Devoluciones (
    Id_Devolucion NUMBER PRIMARY KEY,
    Fecha_Solicitud TIMESTAMP DEFAULT SYSTIMESTAMP,
    Motivo CLOB,  
    Estado VARCHAR2(50) NOT NULL,
    Ordenes_Id_Orden NUMBER NOT NULL,
    Productos_Id_Producto NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_Devoluciones_Orden FOREIGN KEY (Ordenes_Id_Orden)
         REFERENCES Ordenes(Id_Orden),
    CONSTRAINT fk_Devoluciones_Producto FOREIGN KEY (Productos_Id_Producto)
         REFERENCES Productos(Id_Producto)
);

--6. creacion tabla Direccion 
CREATE TABLE Direccion (
    Id_Direccion NUMBER PRIMARY KEY,
    Address VARCHAR2(150) NOT NULL,
    Usuarios_Id_Usuario NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_Direccion_Usuario FOREIGN KEY (Usuarios_Id_Usuario)
         REFERENCES Usuarios(Id_Usuario)
);


--7. creacion tabla envios
CREATE TABLE Envios (
    Id_Envio NUMBER PRIMARY KEY,
    Fecha_Despacho TIMESTAMP DEFAULT SYSTIMESTAMP,
    Compania VARCHAR2(100) NOT NULL,
    NumeroEnvio VARCHAR2(100) NOT NULL,
    Estado VARCHAR2(50) NOT NULL,
    Direccion_Usuarios_Id_Usuario NUMBER NOT NULL,
    Direccion_Id_Direccion NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_Envios_Usuario FOREIGN KEY (Direccion_Usuarios_Id_Usuario)
         REFERENCES Usuarios(Id_Usuario),
    CONSTRAINT fk_Envios_Direccion FOREIGN KEY (Direccion_Id_Direccion)
         REFERENCES Direccion(Id_Direccion)
);


--8. creacion tabla ImagenProducto
CREATE TABLE ImagenProducto (
    Id_Imagen NUMBER PRIMARY KEY,
    UrlImagen VARCHAR2(500) NOT NULL,
    Productos_Id_Producto NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_ImagenProducto_Producto FOREIGN KEY (Productos_Id_Producto)
         REFERENCES Productos(Id_Producto)
);

--9. creacion tabla Inventario
CREATE TABLE Inventario (
    Id_Inventario NUMBER PRIMARY KEY,
    Cantidad NUMBER NOT NULL,
    Sede_Id_Sede NUMBER NOT NULL,
    Productos_Id_Producto NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT uq_Inventario UNIQUE (Sede_Id_Sede, Productos_Id_Producto),
    CONSTRAINT fk_Inventario_Sede FOREIGN KEY (Sede_Id_Sede)
         REFERENCES Sede(Id_Sede),
    CONSTRAINT fk_Inventario_Producto FOREIGN KEY (Productos_Id_Producto)
         REFERENCES Productos(Id_Producto)
);


--10. creacion tabla Metodo_Pago
CREATE TABLE Metodo_Pago (
    Id_MetodoPago NUMBER PRIMARY KEY,
    Tipo_Pago VARCHAR2(50) NOT NULL,
    Detalles_Pago VARCHAR2(100) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    Usuarios_Id_Usuario NUMBER NOT NULL,
    CONSTRAINT uq_Metodo_Pago_Usuarios UNIQUE (Usuarios_Id_Usuario),
    CONSTRAINT fk_Metodo_Pago_Usuarios FOREIGN KEY (Usuarios_Id_Usuario)
         REFERENCES Usuarios(Id_Usuario)
);


--11. creacion tabla Ordenes
CREATE TABLE Ordenes (
    Id_Orden NUMBER PRIMARY KEY,
    Estado VARCHAR2(50) NOT NULL,
    Pago_Id_Pago NUMBER NOT NULL,
    Sede_Id_Sede NUMBER NOT NULL,
    Usuarios_Id_Usuario NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_Ordenes_Pago FOREIGN KEY (Pago_Id_Pago)
         REFERENCES Pagos(Id_Pago),
    CONSTRAINT fk_Ordenes_Sede FOREIGN KEY (Sede_Id_Sede)
         REFERENCES Sede(Id_Sede),
    CONSTRAINT fk_Ordenes_Usuarios FOREIGN KEY (Usuarios_Id_Usuario)
         REFERENCES Usuarios(Id_Usuario)
);


--12. creacion tabla Pagos
CREATE TABLE Pagos (
    Id_Pago NUMBER PRIMARY KEY,
    Fecha_Transaccion TIMESTAMP DEFAULT SYSTIMESTAMP,
    Monto NUMBER(10,2) NOT NULL,
    Estado_Pago VARCHAR2(50) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    Metodo_Pago_Id_MetodoPago NUMBER NOT NULL,
    CONSTRAINT uq_Pagos_Metodo_Pago UNIQUE (Metodo_Pago_Id_MetodoPago),
    CONSTRAINT fk_Pagos_Metodo_Pago FOREIGN KEY (Metodo_Pago_Id_MetodoPago)
         REFERENCES Metodo_Pago(Id_MetodoPago)
);


--13. creacion tabla Productos
CREATE TABLE Productos (
    Id_Producto NUMBER PRIMARY KEY,
    SKu VARCHAR2(50) NOT NULL,
    Nombre VARCHAR2(50) NOT NULL,
    Descripcion VARCHAR2(500) NOT NULL,
    Precio NUMBER(10,2) NOT NULL,
    Slug VARCHAR2(150) NOT NULL,
    Activo VARCHAR2(20) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    Categoria_Id_Categoria NUMBER NOT NULL,
    CONSTRAINT fk_Productos_Categoria FOREIGN KEY (Categoria_Id_Categoria)
         REFERENCES Categoria(Id_Categoria)
);


--14. creacion tabla Sede
CREATE TABLE Sede (
    Id_Sede NUMBER PRIMARY KEY,
    Nombre VARCHAR2(50) NOT NULL,
    Ubicacion VARCHAR2(150) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP
);


--15. creacion tabla Trabajadores
CREATE TABLE Trabajadores (
    Id_Trabajador NUMBER PRIMARY KEY,
    Identificacion_Nacional VARCHAR2(50) NOT NULL,
    Nombre VARCHAR2(50) NOT NULL,
    Apellido VARCHAR2(50) NOT NULL,
    Cargo VARCHAR2(50) NOT NULL,
    Telefono VARCHAR2(50) NOT NULL,
    Email_Institucional VARCHAR2(50) NOT NULL,
    Activo VARCHAR2(20) NOT NULL,
    Departamento_Id_Departamento NUMBER NOT NULL,
    Sede_Id_Sede NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_Trabajadores_Departamento FOREIGN KEY (Departamento_Id_Departamento)
         REFERENCES Departamento(Id_Departamento),
    CONSTRAINT fk_Trabajadores_Sede FOREIGN KEY (Sede_Id_Sede)
         REFERENCES Sede(Id_Sede)
);


--16. creacion tabla Traslados
CREATE TABLE Traslados (
    Id_Traslado NUMBER PRIMARY KEY,
    Fecha_Movimiento TIMESTAMP DEFAULT SYSTIMESTAMP,
    Origen NUMBER NOT NULL,
    Destino NUMBER NOT NULL,
    Estado VARCHAR2(50) NOT NULL,
    Fecha_Llegada TIMESTAMP DEFAULT SYSTIMESTAMP,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    CONSTRAINT fk_Traslados_Origen FOREIGN KEY (Origen)
         REFERENCES Sede(Id_Sede),
    CONSTRAINT fk_Traslados_Destino FOREIGN KEY (Destino)
         REFERENCES Sede(Id_Sede)
);


--17. creacion tabla Usuarios
CREATE TABLE Usuarios (
    Id_Usuario NUMBER PRIMARY KEY,
    Identificacion_Nacional VARCHAR2(50) NOT NULL,
    Nombre VARCHAR2(50) NOT NULL,
    Apellido VARCHAR2(50) NOT NULL,
    Telefono VARCHAR2(50) NOT NULL,
    Email VARCHAR2(50) NOT NULL,
    Contraseña VARCHAR2(100) NOT NULL,
    Activo NUMBER(1) NOT NULL,
    Correo_Confirmado NUMBER(1) NOT NULL,
    created_at TIMESTAMP DEFAULT SYSTIMESTAMP,
    updated_at TIMESTAMP DEFAULT SYSTIMESTAMP
);






