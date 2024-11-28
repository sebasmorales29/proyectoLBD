/*Creacion del Archivo SQL*/
/*Pizza la zompopa*/


CREATE TABLE Rol (
    id_rol NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE Categoria (
    id_categoria NUMBER PRIMARY KEY,
    descripcion VARCHAR2(255) NOT NULL,
    activo CHAR(1) DEFAULT 'Y'
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
    id_direccion NUMBER REFERENCES Direccion(id_direccion),
    id_telefono NUMBER REFERENCES Telefono(id_telefono),
    activo CHAR(1) DEFAULT 'Y'
);

CREATE TABLE Direccion (
    id_direccion NUMBER PRIMARY KEY,
    provincia VARCHAR2(100) NOT NULL,
    ciudad VARCHAR2(100) NOT NULL,
    ubicacion_exacta VARCHAR2(255)
);

CREATE TABLE Telefono (
    id_telefono NUMBER PRIMARY KEY,
    numero_telefono VARCHAR2(15) NOT NULL
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



CREATE TABLE Ofertas (
    id_ofertas NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(255),
    imagen BLOB,
    activo CHAR(1) DEFAULT 'Y'
);



--************************CREACION DE SECUENCIAS **************************
--GRUPO 1 LBD

CREATE SEQUENCE SEQ_ROL START WITH 1;
CREATE SEQUENCE SEQ_CATEGORIA START WITH 1;
CREATE SEQUENCE SEQ_USUARIO START WITH 1;
CREATE SEQUENCE SEQ_DIRECCION START WITH 1;
CREATE SEQUENCE SEQ_TELEFONO START WITH 1;
CREATE SEQUENCE SEQ_PRODUCTO START WITH 1;
CREATE SEQUENCE SEQ_FACTURA START WITH 1;
CREATE SEQUENCE SEQ_DETALLE_FACTURA START WITH 1;
CREATE SEQUENCE SEQ_OFERTAS START WITH 1;
CREATE SEQUENCE SEQ_HISTORIAL_VENTAS START WITH 1;


