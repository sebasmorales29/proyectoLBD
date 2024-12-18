/*Creacion del Archivo SQL*/
/*Pizza la zompopa*/

--Productos
CREATE TABLE Categoria (
    id_categoria NUMBER PRIMARY KEY,
    descripcion VARCHAR2(255) NOT NULL,
    activo CHAR(1) DEFAULT 'Y'
);

CREATE TABLE Producto (
    id_producto NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(255),
    precio NUMBER(10, 2) NOT NULL,
    existencias NUMBER DEFAULT 0,
    activo CHAR(1) DEFAULT 'Y',
    id_categoria NUMBER NOT NULL REFERENCES Categoria(id_categoria)
);

CREATE TABLE Ofertas (
    id_ofertas NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(255),
    imagen ,
    activo CHAR(1) DEFAULT 'Y'
);


--Usuario
CREATE TABLE Rol (
    id_rol NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE Usuario (
    id_usuario NUMBER PRIMARY KEY,
    nombre_usuario VARCHAR2(50) NOT NULL,
    nombre VARCHAR2(100) NOT NULL,
    prim_apellido VARCHAR2(100) NOT NULL,
    seg_apellido VARCHAR2(100),
    correo VARCHAR2(150) UNIQUE NOT NULL,
    contrasena VARCHAR2(100) NOT NULL,
    id_rol NUMBER REFERENCES Rol(id_rol),
    activo CHAR(1) DEFAULT 'Y'
);

--Factura
CREATE TABLE Factura (
    id_factura NUMBER PRIMARY KEY,
    fecha DATE DEFAULT SYSDATE,
    total NUMBER(10, 2) DEFAULT 0,
    id_usuario NUMBER NOT NULL REFERENCES Usuario(id_usuario)
);

CREATE TABLE Detalle_Factura (
    id_venta NUMBER PRIMARY KEY,
    precio NUMBER(10, 2) NOT NULL,
    cantidad NUMBER NOT NULL,
    id_factura NUMBER NOT NULL REFERENCES Factura(id_factura),
    id_producto NUMBER NOT NULL REFERENCES Producto(id_producto)
);

CREATE TABLE Historial_Ventas (
    id_historial_ventas NUMBER PRIMARY KEY,
    fecha_venta DATE DEFAULT SYSDATE,
    id_usuario NUMBER REFERENCES Usuario(id_usuario)
);



 




