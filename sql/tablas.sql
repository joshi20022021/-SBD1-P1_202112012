-- Tabla: Categoria
CREATE TABLE Categoria 
(
    IdCategoria NUMBER(10,1) NOT NULL, 
    Nombre      VARCHAR2(50), 
    created_at  DATE, 
    updated_at  DATE
);

ALTER TABLE Categoria 
    ADD CONSTRAINT Categoria_PK PRIMARY KEY (IdCategoria);

-- Tabla: Departamento
CREATE TABLE Departamento 
(
    IdDepartamento NUMBER(10,1) NOT NULL, 
    Nombre         VARCHAR2(100), 
    created_at     DATE, 
    updated_at     DATE
);

ALTER TABLE Departamento 
    ADD CONSTRAINT Departamento_PK PRIMARY KEY (IdDepartamento);

-- Tabla: Detalle_Orden
CREATE TABLE Detalle_Orden 
(
    Orden_Id              NUMBER NOT NULL, 
    created_at            DATE, 
    updated_at            DATE, 
    Productos_Id_Producto NUMBER NOT NULL, 
    Ordenes_Id_Orden      NUMBER(10,1) NOT NULL, 
    Ordenes_IdDireccion   NUMBER(10,1) NOT NULL
);

ALTER TABLE Detalle_Orden 
    ADD CONSTRAINT Detalle_Orden_PK PRIMARY KEY (Orden_Id);

-- Tabla: Detalle_Traslados
CREATE TABLE Detalle_Traslados 
(
    Id_Traslado           NUMBER(10,1) NOT NULL, 
    Traslados_Id_Traslado NUMBER(10,1) NOT NULL, 
    Productos_Id_Producto NUMBER NOT NULL, 
    Cantidad              VARCHAR2(50) NOT NULL, 
    created_at            DATE, 
    updated_at            DATE
);

ALTER TABLE Detalle_Traslados 
    ADD CONSTRAINT Detalle_Traslados_PK PRIMARY KEY (Id_Traslado);

-- Tabla: Devoluciones
CREATE TABLE Devoluciones 
(
    Id_Devolucion       NUMBER(10,1) NOT NULL, 
    Fecha_Solicitud     DATE, 
    Motivo              CLOB, 
    Estado              VARCHAR2(50), 
    created_at          DATE, 
    updated_at          DATE, 
    Ordenes_Id_Orden    NUMBER(10,1) NOT NULL, 
    Ordenes_IdDireccion NUMBER(10,1) NOT NULL
);

ALTER TABLE Devoluciones 
    ADD CONSTRAINT Devoluciones_PK PRIMARY KEY (Id_Devolucion);

-- Tabla: Direccion
CREATE TABLE Direccion 
(
    IdDireccion         NUMBER(10,1) NOT NULL, 
    Calle               VARCHAR2(200), 
    Usuarios_Id_Usuario INTEGER NOT NULL, 
    Ciudad              VARCHAR2(100), 
    CodigoPostal        VARCHAR2(20), 
    created_at          DATE, 
    updated_at          DATE
);

ALTER TABLE Direccion 
    ADD CONSTRAINT Direccion_PK PRIMARY KEY (IdDireccion);

-- Tabla: Envios
CREATE TABLE Envios 
(
    Id_Envio              NUMBER(10,1) NOT NULL, 
    Fecha_Despacho        DATE, 
    Direccion             VARCHAR2(100), 
    Transporte            VARCHAR2(100), 
    NumeroEnvio           VARCHAR2(20), 
    Estado                VARCHAR2(20), 
    created_at            DATE, 
    updated_at            DATE, 
    Direccion_IdDireccion NUMBER(10,1) NOT NULL
);

ALTER TABLE Envios 
    ADD CONSTRAINT Envios_PK PRIMARY KEY (Id_Envio, Direccion_IdDireccion);

-- Tabla: ImagenProducto
CREATE TABLE ImagenProducto 
(
    IdImagen              NUMBER(10,1) NOT NULL, 
    IdProducto            NUMBER(10,1), 
    UrlImagen             VARCHAR2(255), 
    created_at            DATE, 
    updated_at            DATE, 
    Productos_Id_Producto NUMBER NOT NULL
);

ALTER TABLE ImagenProducto 
    ADD CONSTRAINT ImagenProducto_PK PRIMARY KEY (IdImagen);

-- Tabla: Metodo_Pago
CREATE TABLE Metodo_Pago 
(
    IdPago              VARCHAR2(50) NOT NULL, 
    Tipo_Pago           VARCHAR2(50), 
    Detalles_Pago       VARCHAR2(100), 
    created_at          DATE, 
    updated_at          DATE, 
    Usuarios_Id_Usuario INTEGER NOT NULL
);

ALTER TABLE Metodo_Pago 
    ADD CONSTRAINT Metodo_Pago_PK PRIMARY KEY (IdPago, Usuarios_Id_Usuario);

-- Tabla: Ordenes
CREATE TABLE Ordenes 
(
    Id_Orden              NUMBER(10,1) NOT NULL, 
    Total                 VARCHAR2(10), 
    Estado                CHAR(1), 
    created_at            DATE, 
    updated_at            DATE, 
    Pagos_Id_Pago         NUMBER(10,1) NOT NULL, 
    Envios_Id_Envio       NUMBER(10,1) NOT NULL, 
    Direccion_IdDireccion NUMBER(10,1) NOT NULL, 
    Envios_IdDireccion    NUMBER(10,1) NOT NULL, 
    Usuarios_Id_Usuario   INTEGER NOT NULL
);

CREATE UNIQUE INDEX Ordenes__IDX ON Ordenes 
(
    Pagos_Id_Pago ASC
);

ALTER TABLE Ordenes 
    ADD CONSTRAINT Ordenes_PK PRIMARY KEY (Id_Orden, Direccion_IdDireccion);

-- Tabla: Pagos
CREATE TABLE Pagos 
(
    Id_Pago           NUMBER(10,1) NOT NULL, 
    Fecha_Transaccion DATE, 
    Monto             NUMBER(10,2), 
    Metodo_Pago       VARCHAR2(50), 
    Estado_Pago       VARCHAR2(50), 
    created_at        DATE, 
    updated_at        DATE
);

ALTER TABLE Pagos 
    ADD CONSTRAINT Pagos_PK PRIMARY KEY (Id_Pago);

-- Tabla: Productos
CREATE TABLE Productos 
(
    Id_Producto           NUMBER NOT NULL, 
    Sku                   VARCHAR2(50), 
    Nombre                VARCHAR2(150), 
    Descripcion           VARCHAR2(500), 
    Precio                NUMBER(10,2), 
    Slug                  VARCHAR2(150), 
    Activo                CHAR(1), 
    created_at            DATE, 
    updated_at            DATE, 
    Categoria_IdCategoria NUMBER(10,1) NOT NULL
);

ALTER TABLE Productos 
    ADD CONSTRAINT Productos_PK PRIMARY KEY (Id_Producto);

-- Tabla: Sede
CREATE TABLE Sede 
(
    IdSede     NUMBER(10,1) NOT NULL, 
    Nombre     VARCHAR2(100), 
    Ubicacion  VARCHAR2(150), 
    created_at DATE, 
    updated_at DATE
);

ALTER TABLE Sede 
    ADD CONSTRAINT Sede_PK PRIMARY KEY (IdSede);

-- Tabla: Trabajadores
CREATE TABLE Trabajadores 
(
    Id_Trabajador               NUMBER(10,1) NOT NULL, 
    Identificacion_Nacional     VARCHAR2(20), 
    Nombre                      VARCHAR2(100), 
    Apellido                    VARCHAR2(100), 
    Cargo                       VARCHAR2(100), 
    Telefono                    VARCHAR2(15), 
    Email_Institucional         VARCHAR2(50), 
    Sede                        VARCHAR2(50), 
    Activo                      VARCHAR2(50), 
    created_at                  DATE, 
    updated_at                  DATE, 
    Sede_IdSede                 NUMBER(10,1) NOT NULL, 
    Departamento_IdDepartamento NUMBER(10,1) NOT NULL
);

ALTER TABLE Trabajadores 
    ADD CONSTRAINT Trabajadores_PK PRIMARY KEY (Id_Trabajador);

-- Tabla: Traslados
CREATE TABLE Traslados 
(
    Id_Traslado      NUMBER(10,1) NOT NULL, 
    Fecha_Movimiento DATE, 
    Origen           NUMBER(10,1), 
    Destino          NUMBER(10,1), 
    Estado           VARCHAR2(50), 
    Fecha_Llegada    DATE, 
    created_at       DATE, 
    updated_at       DATE, 
    Sede_IdSede      NUMBER(10,1) NOT NULL
);

ALTER TABLE Traslados 
    ADD CONSTRAINT Traslados_PK PRIMARY KEY (Id_Traslado);

-- Tabla: Usuarios
CREATE TABLE Usuarios 
(
    Id_Usuario              INTEGER NOT NULL, 
    Identificacion_Nacional CHAR(50), 
    Nombre                  VARCHAR2(100), 
    Apellido                VARCHAR2(100), 
    Telefono                VARCHAR2(20), 
    Email                   VARCHAR2(150), 
    Activo                  CHAR(1), 
    FechaRegistro           DATE, 
    Correo_Confirmado       CHAR(1), 
    Direccion               VARCHAR2(150)
);

ALTER TABLE Usuarios 
    ADD CONSTRAINT Usuarios_PK PRIMARY KEY (Id_Usuario);

-- Relaciones (Foreign Keys)

ALTER TABLE Detalle_Orden 
    ADD CONSTRAINT Detalle_Orden_Ordenes_FK FOREIGN KEY 
    (Ordenes_Id_Orden, Ordenes_IdDireccion)
    REFERENCES Ordenes 
    (Id_Orden, Direccion_IdDireccion);

ALTER TABLE Detalle_Orden 
    ADD CONSTRAINT Detalle_Orden_Productos_FK FOREIGN KEY 
    (Productos_Id_Producto)
    REFERENCES Productos 
    (Id_Producto);

ALTER TABLE Detalle_Traslados 
    ADD CONSTRAINT Detalle_Traslados_Productos_FK FOREIGN KEY 
    (Productos_Id_Producto)
    REFERENCES Productos 
    (Id_Producto);

ALTER TABLE Detalle_Traslados 
    ADD CONSTRAINT Detalle_Traslados_Traslados_FK FOREIGN KEY 
    (Traslados_Id_Traslado)
    REFERENCES Traslados 
    (Id_Traslado);

ALTER TABLE Devoluciones 
    ADD CONSTRAINT Devoluciones_Ordenes_FK FOREIGN KEY 
    (Ordenes_Id_Orden, Ordenes_IdDireccion)
    REFERENCES Ordenes 
    (Id_Orden, Direccion_IdDireccion);

ALTER TABLE Direccion 
    ADD CONSTRAINT Direccion_Usuarios_FK FOREIGN KEY 
    (Usuarios_Id_Usuario)
    REFERENCES Usuarios 
    (Id_Usuario);

ALTER TABLE Envios 
    ADD CONSTRAINT Envios_Direccion_FK FOREIGN KEY 
    (Direccion_IdDireccion)
    REFERENCES Direccion 
    (IdDireccion);

ALTER TABLE ImagenProducto 
    ADD CONSTRAINT ImagenProducto_Productos_FK FOREIGN KEY 
    (Productos_Id_Producto)
    REFERENCES Productos 
    (Id_Producto);

ALTER TABLE Metodo_Pago 
    ADD CONSTRAINT Metodo_Pago_Usuarios_FK FOREIGN KEY 
    (Usuarios_Id_Usuario)
    REFERENCES Usuarios 
    (Id_Usuario);

ALTER TABLE Ordenes 
    ADD CONSTRAINT Ordenes_Direccion_FK FOREIGN KEY 
    (Direccion_IdDireccion)
    REFERENCES Direccion 
    (IdDireccion);

ALTER TABLE Ordenes 
    ADD CONSTRAINT Ordenes_Envios_FK FOREIGN KEY 
    (Envios_Id_Envio, Envios_IdDireccion)
    REFERENCES Envios 
    (Id_Envio, Direccion_IdDireccion);

ALTER TABLE Ordenes 
    ADD CONSTRAINT Ordenes_Pagos_FK FOREIGN KEY 
    (Pagos_Id_Pago)
    REFERENCES Pagos 
    (Id_Pago);

ALTER TABLE Ordenes 
    ADD CONSTRAINT Ordenes_Usuarios_FK FOREIGN KEY 
    (Usuarios_Id_Usuario)
    REFERENCES Usuarios 
    (Id_Usuario);

ALTER TABLE Productos 
    ADD CONSTRAINT Productos_Categoria_FK FOREIGN KEY 
    (Categoria_IdCategoria)
    REFERENCES Categoria 
    (IdCategoria);

ALTER TABLE Trabajadores 
    ADD CONSTRAINT Trabajadores_Departamento_FK FOREIGN KEY 
    (Departamento_IdDepartamento)
    REFERENCES Departamento 
    (IdDepartamento);

ALTER TABLE Trabajadores 
    ADD CONSTRAINT Trabajadores_Sede_FK FOREIGN KEY 
    (Sede_IdSede)
    REFERENCES Sede 
    (IdSede);

ALTER TABLE Traslados 
    ADD CONSTRAINT Traslados_Sede_FK FOREIGN KEY 
    (Sede_IdSede)
    REFERENCES Sede 
    (IdSede);
