--------------------------------------------------------
--  File created - Wednesday-December-18-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_CATEGORIA
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_CATEGORIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_DETALLE_FACTURA
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_DETALLE_FACTURA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_DIRECCION
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_DIRECCION"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FACTURA
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_FACTURA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_HISTORIAL_VENTAS
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_HISTORIAL_VENTAS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_OFERTAS
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_OFERTAS"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 161 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PRODUCTO
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_PRODUCTO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ROL
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_ROL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_TELEFONO
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_TELEFONO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence SEQ_USUARIO
--------------------------------------------------------

   CREATE SEQUENCE  "ADM_PROYECTO_LBD"."SEQ_USUARIO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table CATEGORIA
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."CATEGORIA" 
   (	"ID_CATEGORIA" NUMBER, 
	"DESCRIPCION" VARCHAR2(255 BYTE), 
	"ACTIVO" CHAR(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DETALLE_FACTURA
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."DETALLE_FACTURA" 
   (	"ID_VENTA" NUMBER, 
	"PRECIO" NUMBER(10,2), 
	"CANTIDAD" NUMBER, 
	"ID_FACTURA" NUMBER, 
	"ID_PRODUCTO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DIRECCION
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."DIRECCION" 
   (	"ID_DIRECCION" NUMBER, 
	"PROVINCIA" VARCHAR2(100 BYTE), 
	"CIUDAD" VARCHAR2(100 BYTE), 
	"UBICACION_EXACTA" VARCHAR2(255 BYTE), 
	"ID_USUARIO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FACTURA
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."FACTURA" 
   (	"ID_FACTURA" NUMBER, 
	"FECHA" DATE DEFAULT SYSDATE, 
	"TOTAL" NUMBER(10,2) DEFAULT 0, 
	"ID_USUARIO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table HISTORIAL_VENTAS
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."HISTORIAL_VENTAS" 
   (	"ID_HISTORIAL_VENTAS" NUMBER, 
	"FECHA_VENTA" DATE DEFAULT SYSDATE, 
	"ID_USUARIO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table OFERTAS
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."OFERTAS" 
   (	"ID_OFERTAS" NUMBER, 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"DESCRIPCION" VARCHAR2(255 BYTE), 
	"IMAGEN" VARCHAR2(500 BYTE), 
	"ACTIVO" CHAR(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PRODUCTO
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."PRODUCTO" 
   (	"ID_PRODUCTO" NUMBER, 
	"NOMBRE" VARCHAR2(255 CHAR), 
	"DESCRIPCION" VARCHAR2(255 BYTE), 
	"PRECIO" FLOAT(53), 
	"EXISTENCIAS" NUMBER DEFAULT 0, 
	"ACTIVO" CHAR(1 BYTE) DEFAULT 'Y', 
	"ID_CATEGORIA" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ROL
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."ROL" 
   (	"ID_ROL" NUMBER, 
	"NOMBRE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TELEFONO
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."TELEFONO" 
   (	"ID_TELEFONO" NUMBER, 
	"NUMERO_TELEFONO" VARCHAR2(15 BYTE), 
	"ID_USUARIO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USUARIO
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."USUARIO" 
   (	"ID_USUARIO" NUMBER, 
	"NOMBRE_USUARIO" VARCHAR2(50 BYTE), 
	"NOMBRE" VARCHAR2(100 BYTE), 
	"PRIM_APELLIDO" VARCHAR2(100 BYTE), 
	"SEG_APELLIDO" VARCHAR2(100 BYTE), 
	"CORREO" VARCHAR2(150 BYTE), 
	"CONTRASENA" VARCHAR2(100 BYTE), 
	"ID_ROL" NUMBER, 
	"ACTIVO" CHAR(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table V_PRODUCTOS
--------------------------------------------------------

  CREATE TABLE "ADM_PROYECTO_LBD"."V_PRODUCTOS" 
   (	"ID" NUMBER(19,0), 
	"NOMBRE" VARCHAR2(255 CHAR), 
	"PRECIO" FLOAT(53), 
	"ID_PRODUCTO" NUMBER(19,0)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for View ITEMS_FACTURA
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."ITEMS_FACTURA" ("ID_FACTURA", "PRECIO", "CANTIDAD") AS 
  SELECT id_factura,precio, cantidad
        FROM detalle_factura
;
--------------------------------------------------------
--  DDL for View VISTA_FACTURA
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."VISTA_FACTURA" ("ID_FACTURA", "FECHA", "TOTAL", "ID_USUARIO") AS 
  SELECT id_factura,fecha, total,id_usuario
        FROM factura
;
--------------------------------------------------------
--  DDL for View V_CATEGORIA
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."V_CATEGORIA" ("ID_CATEGORIA", "DESCRIPCION", "ESTADO") AS 
  SELECT id_categoria, descripcion,
    CASE 
        WHEN activo = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS estado
FROM Categoria
;
--------------------------------------------------------
--  DDL for View V_DIRECCION
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."V_DIRECCION" ("ID_DIRECCION", "PROVINCIA", "CIUDAD", "UBICACION_EXACTA", "USUARIO") AS 
  SELECT d.id_direccion,d.provincia,d.ciudad,d.ubicacion_exacta,u.nombre_usuario AS usuario
FROM Direccion d
LEFT JOIN Usuario u ON d.id_usuario = u.id_usuario
;
--------------------------------------------------------
--  DDL for View V_OFERTAS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."V_OFERTAS" ("ID_OFERTAS", "NOMBRE", "DESCRIPCION", "IMAGEN", "ESTADO") AS 
  SELECT 
    id_ofertas,
    nombre,
    descripcion,
    imagen,
    CASE 
        WHEN activo = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS estado
FROM 
    Ofertas
;
--------------------------------------------------------
--  DDL for View V_PRODUCTO
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."V_PRODUCTO" ("ID_PRODUCTO", "NOMBRE", "DESCRIPCION", "PRECIO", "EXISTENCIAS", "CATEGORIA", "ESTADO") AS 
  SELECT p.id_producto,p.nombre,p.descripcion,p.precio,p.existencias,c.descripcion AS categoria,
    CASE 
        WHEN p.activo = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS estado
FROM Producto p
LEFT JOIN Categoria c ON p.id_categoria = c.id_categoria
;
  GRANT DELETE ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT INSERT ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT SELECT ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT UPDATE ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT REFERENCES ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT READ ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT ON COMMIT REFRESH ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT QUERY REWRITE ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT DEBUG ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT FLASHBACK ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
  GRANT MERGE VIEW ON "ADM_PROYECTO_LBD"."V_PRODUCTO" TO "SYS";
--------------------------------------------------------
--  DDL for View V_PRODUCTO_PRUEBA
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."V_PRODUCTO_PRUEBA" ("ID_PRODUCTO", "NOMBRE") AS 
  SELECT 
    id_producto AS id_producto,
    nombre

FROM 
    producto
;
--------------------------------------------------------
--  DDL for View V_ROL
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."V_ROL" ("ID_ROL", "NOMBRE") AS 
  SELECT id_rol, nombre
FROM Rol
;
--------------------------------------------------------
--  DDL for View V_TELEFONOS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."V_TELEFONOS" ("ID_TELEFONO", "NUMERO_TELEFONO", "ROL") AS 
  SELECT 
    t.id_telefono,
    t.numero_telefono,
    r.nombre AS rol
FROM 
    Telefono t
LEFT JOIN 
    Usuario u ON t.id_usuario = u.id_usuario
LEFT JOIN 
    Rol r ON u.id_rol = r.id_rol
;
--------------------------------------------------------
--  DDL for View V_USUARIO
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "ADM_PROYECTO_LBD"."V_USUARIO" ("ID_USUARIO", "CONTRASENA", "CORREO", "ACTIVO", "ID_ROL", "NOMBRE", "NOMBRE_USUARIO", "PRIM_APELLIDO", "SEG_APELLIDO", "ROL") AS 
  SELECT 
    u.id_usuario,
    u.contrasena,
    u.correo,
    u.activo,
    u.id_rol,
    u.nombre,
    u.nombre_usuario,
    u.prim_apellido,
    u.seg_apellido,
    r.nombre AS rol
FROM 
    usuario u
LEFT JOIN 
    rol r ON u.id_rol = r.id_rol
;
REM INSERTING into ADM_PROYECTO_LBD.CATEGORIA
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.CATEGORIA (ID_CATEGORIA,DESCRIPCION,ACTIVO) values (41,'adfasdfasdf','N');
Insert into ADM_PROYECTO_LBD.CATEGORIA (ID_CATEGORIA,DESCRIPCION,ACTIVO) values (42,'oferta2','N');
Insert into ADM_PROYECTO_LBD.CATEGORIA (ID_CATEGORIA,DESCRIPCION,ACTIVO) values (43,'oferta2','Y');
Insert into ADM_PROYECTO_LBD.CATEGORIA (ID_CATEGORIA,DESCRIPCION,ACTIVO) values (44,'asdf','N');
Insert into ADM_PROYECTO_LBD.CATEGORIA (ID_CATEGORIA,DESCRIPCION,ACTIVO) values (45,'nueva','Y');
Insert into ADM_PROYECTO_LBD.CATEGORIA (ID_CATEGORIA,DESCRIPCION,ACTIVO) values (21,'Pizza','Y');
Insert into ADM_PROYECTO_LBD.CATEGORIA (ID_CATEGORIA,DESCRIPCION,ACTIVO) values (22,'Bebidas','Y');
REM INSERTING into ADM_PROYECTO_LBD.DETALLE_FACTURA
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.DETALLE_FACTURA (ID_VENTA,PRECIO,CANTIDAD,ID_FACTURA,ID_PRODUCTO) values (1,1000,1,1,1);
Insert into ADM_PROYECTO_LBD.DETALLE_FACTURA (ID_VENTA,PRECIO,CANTIDAD,ID_FACTURA,ID_PRODUCTO) values (2,2000,2,2,2);
Insert into ADM_PROYECTO_LBD.DETALLE_FACTURA (ID_VENTA,PRECIO,CANTIDAD,ID_FACTURA,ID_PRODUCTO) values (3,3000,5,1,2);
REM INSERTING into ADM_PROYECTO_LBD.DIRECCION
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.DIRECCION (ID_DIRECCION,PROVINCIA,CIUDAD,UBICACION_EXACTA,ID_USUARIO) values (1,'San José','Escazú','Calle 123',1);
Insert into ADM_PROYECTO_LBD.DIRECCION (ID_DIRECCION,PROVINCIA,CIUDAD,UBICACION_EXACTA,ID_USUARIO) values (2,'Alajuela','Central','Avenida 456',2);
REM INSERTING into ADM_PROYECTO_LBD.FACTURA
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.FACTURA (ID_FACTURA,FECHA,TOTAL,ID_USUARIO) values (1,to_date('27-NOV-24','DD-MON-RR'),16000,1);
Insert into ADM_PROYECTO_LBD.FACTURA (ID_FACTURA,FECHA,TOTAL,ID_USUARIO) values (2,to_date('27-NOV-24','DD-MON-RR'),8000,2);
Insert into ADM_PROYECTO_LBD.FACTURA (ID_FACTURA,FECHA,TOTAL,ID_USUARIO) values (3,to_date('27-NOV-24','DD-MON-RR'),5000,1);
REM INSERTING into ADM_PROYECTO_LBD.HISTORIAL_VENTAS
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.HISTORIAL_VENTAS (ID_HISTORIAL_VENTAS,FECHA_VENTA,ID_USUARIO) values (5,to_date('27-NOV-24','DD-MON-RR'),1);
Insert into ADM_PROYECTO_LBD.HISTORIAL_VENTAS (ID_HISTORIAL_VENTAS,FECHA_VENTA,ID_USUARIO) values (6,to_date('27-NOV-24','DD-MON-RR'),2);
REM INSERTING into ADM_PROYECTO_LBD.OFERTAS
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.OFERTAS (ID_OFERTAS,NOMBRE,DESCRIPCION,IMAGEN,ACTIVO) values (121,'oferta506516212311','asdfasdf','Activa','Y');
Insert into ADM_PROYECTO_LBD.OFERTAS (ID_OFERTAS,NOMBRE,DESCRIPCION,IMAGEN,ACTIVO) values (123,'oferta2','asdf','asdf','Y');
Insert into ADM_PROYECTO_LBD.OFERTAS (ID_OFERTAS,NOMBRE,DESCRIPCION,IMAGEN,ACTIVO) values (141,'nueva','oferta','asdfasdf','Y');
REM INSERTING into ADM_PROYECTO_LBD.PRODUCTO
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.PRODUCTO (ID_PRODUCTO,NOMBRE,DESCRIPCION,PRECIO,EXISTENCIAS,ACTIVO,ID_CATEGORIA) values (1,'pizza de la casa','pizza de la casa',5000,50,'Y',21);
Insert into ADM_PROYECTO_LBD.PRODUCTO (ID_PRODUCTO,NOMBRE,DESCRIPCION,PRECIO,EXISTENCIAS,ACTIVO,ID_CATEGORIA) values (2,'Coca Cola','500ml',1000,200,'Y',22);
REM INSERTING into ADM_PROYECTO_LBD.ROL
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.ROL (ID_ROL,NOMBRE) values (21,'Administrador');
Insert into ADM_PROYECTO_LBD.ROL (ID_ROL,NOMBRE) values (22,'Usuario');
REM INSERTING into ADM_PROYECTO_LBD.TELEFONO
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.TELEFONO (ID_TELEFONO,NUMERO_TELEFONO,ID_USUARIO) values (1,'1234567890',1);
Insert into ADM_PROYECTO_LBD.TELEFONO (ID_TELEFONO,NUMERO_TELEFONO,ID_USUARIO) values (2,'9876543210',2);
REM INSERTING into ADM_PROYECTO_LBD.USUARIO
SET DEFINE OFF;
Insert into ADM_PROYECTO_LBD.USUARIO (ID_USUARIO,NOMBRE_USUARIO,NOMBRE,PRIM_APELLIDO,SEG_APELLIDO,CORREO,CONTRASENA,ID_ROL,ACTIVO) values (1,'jp','Juan','Pérez','López','admin@example.com','password123',21,'Y');
Insert into ADM_PROYECTO_LBD.USUARIO (ID_USUARIO,NOMBRE_USUARIO,NOMBRE,PRIM_APELLIDO,SEG_APELLIDO,CORREO,CONTRASENA,ID_ROL,ACTIVO) values (2,'jdoe','John','Doe','Smith','jdoe@example.com','securePass!',22,'Y');
Insert into ADM_PROYECTO_LBD.USUARIO (ID_USUARIO,NOMBRE_USUARIO,NOMBRE,PRIM_APELLIDO,SEG_APELLIDO,CORREO,CONTRASENA,ID_ROL,ACTIVO) values (21,'jbg','jimmy','barquero','granados','asdf@asdf.com','123',21,'Y');
Insert into ADM_PROYECTO_LBD.USUARIO (ID_USUARIO,NOMBRE_USUARIO,NOMBRE,PRIM_APELLIDO,SEG_APELLIDO,CORREO,CONTRASENA,ID_ROL,ACTIVO) values (41,'jbg','Jimmy','Barquero','Barquero','jimmybar17@gmail.com','123',21,'y');
Insert into ADM_PROYECTO_LBD.USUARIO (ID_USUARIO,NOMBRE_USUARIO,NOMBRE,PRIM_APELLIDO,SEG_APELLIDO,CORREO,CONTRASENA,ID_ROL,ACTIVO) values (61,'jbg','Jimmy','Barquero','Granados','21321213@asdfa.com','123',21,'y');
REM INSERTING into ADM_PROYECTO_LBD.V_PRODUCTOS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Trigger TRG_CATEGORIA_BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADM_PROYECTO_LBD"."TRG_CATEGORIA_BI" 
BEFORE INSERT ON Categoria
FOR EACH ROW
BEGIN
    IF :NEW.id_categoria IS NULL THEN
    :NEW.id_categoria := seq_categoria.NEXTVAL;
    END IF;
END;




/
ALTER TRIGGER "ADM_PROYECTO_LBD"."TRG_CATEGORIA_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DETALLE_FACTURA_BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADM_PROYECTO_LBD"."TRG_DETALLE_FACTURA_BI" 
BEFORE INSERT ON Detalle_Factura
FOR EACH ROW
BEGIN
    IF :NEW.id_venta IS NULL THEN
    :NEW.id_venta := seq_detalle_factura.NEXTVAL;
    END IF;
END;

/
ALTER TRIGGER "ADM_PROYECTO_LBD"."TRG_DETALLE_FACTURA_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_FACTURA_BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADM_PROYECTO_LBD"."TRG_FACTURA_BI" 
BEFORE INSERT ON Factura
FOR EACH ROW
BEGIN
    IF :NEW.id_factura IS NULL THEN
    :NEW.id_factura := seq_factura.NEXTVAL;
    END IF;
END;

/
ALTER TRIGGER "ADM_PROYECTO_LBD"."TRG_FACTURA_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_HISTORIAL_VENTAS_BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADM_PROYECTO_LBD"."TRG_HISTORIAL_VENTAS_BI" 
BEFORE INSERT ON Historial_Ventas
FOR EACH ROW
BEGIN
    IF :NEW.id_historial_ventas IS NULL THEN
    :NEW.id_historial_ventas := seq_historial_ventas.NEXTVAL;
    END IF;
END;

/
ALTER TRIGGER "ADM_PROYECTO_LBD"."TRG_HISTORIAL_VENTAS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_OFERTAS_BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADM_PROYECTO_LBD"."TRG_OFERTAS_BI" 
BEFORE INSERT ON Ofertas
FOR EACH ROW
BEGIN
    IF :NEW.id_ofertas IS NULL THEN
    :NEW.id_ofertas := seq_ofertas.NEXTVAL;
    END IF;
END;



/
ALTER TRIGGER "ADM_PROYECTO_LBD"."TRG_OFERTAS_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PRODUCTO_BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADM_PROYECTO_LBD"."TRG_PRODUCTO_BI" 
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF :NEW.id_producto IS NULL THEN
        :NEW.id_producto := seq_producto.NEXTVAL;
    END IF;
END;

/
ALTER TRIGGER "ADM_PROYECTO_LBD"."TRG_PRODUCTO_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_ROL_BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADM_PROYECTO_LBD"."TRG_ROL_BI" 
BEFORE INSERT ON Rol
FOR EACH ROW
BEGIN
    IF :NEW.id_rol IS NULL THEN
    :NEW.id_rol := seq_rol.NEXTVAL;
    END IF;
END;

/
ALTER TRIGGER "ADM_PROYECTO_LBD"."TRG_ROL_BI" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_USUARIO_BI
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADM_PROYECTO_LBD"."TRG_USUARIO_BI" 
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
    IF :NEW.id_usuario IS NULL THEN
        :NEW.id_usuario := seq_usuario.NEXTVAL;
    END IF;
END;

/
ALTER TRIGGER "ADM_PROYECTO_LBD"."TRG_USUARIO_BI" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ACTUALIZATOTALFACTURA
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADM_PROYECTO_LBD"."ACTUALIZATOTALFACTURA" (
    --Se recibe como parametro el id de la factura recientemente creada
    p_id_factura IN NUMBER
)
IS
    v_total NUMBER;
BEGIN

    v_total := CalculaTotalFactura(p_id_factura);

   --
    UPDATE Factura
    SET total = v_total
    WHERE id_factura = p_id_factura;

    COMMIT;
END;

/
--------------------------------------------------------
--  DDL for Package CRUD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ADM_PROYECTO_LBD"."CRUD" AS
    -- Procedimientos para Categoria
    PROCEDURE insertar_categoria(
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    );

    PROCEDURE eliminar_categoria(
        p_id_categoria IN NUMBER
    );

    PROCEDURE modificar_categoria(
        p_id_categoria IN NUMBER,
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    );

    -- Procedimientos para Producto
    PROCEDURE insertar_producto(
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_precio IN NUMBER,
        p_existencias IN NUMBER,
        p_activo IN CHAR,
        p_id_categoria IN NUMBER
    );

    PROCEDURE eliminar_producto(
        p_id_producto IN NUMBER
    );

    PROCEDURE modificar_producto(
        p_id_producto IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_precio IN NUMBER,
        p_existencias IN NUMBER,
        p_activo IN CHAR,
        p_id_categoria IN NUMBER
    );
    -- Procedimientos para Direccion
    PROCEDURE insertar_direccion(
    p_provincia VARCHAR2,
    p_ciudad VARCHAR2,
    p_ubicacion_exacta VARCHAR2,
    p_id_usuario NUMBER
    );
    PROCEDURE eliminar_direccion(
    p_id_direccion NUMBER
    );
    PROCEDURE modificar_direccion(
    p_id_direccion NUMBER,
    p_provincia VARCHAR2,
    p_ciudad VARCHAR2,
    p_ubicacion_exacta VARCHAR2,
    p_id_usuario NUMBER
    );

    -- Procedimientos para Telefono
    PROCEDURE insertar_telefono(
    p_numero_telefono VARCHAR2,
    p_id_usuario NUMBER
    );
    PROCEDURE eliminar_telefono(
    p_id_telefono NUMBER
    );
    PROCEDURE modificar_telefono(
    p_id_telefono NUMBER,
    p_numero_telefono VARCHAR2,
    p_id_usuario NUMBER
    );

    --Procedimientos usuario
        PROCEDURE crear_usuario(
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_activo Char
    );

        PROCEDURE actualizar_usuario(
        p_id_usuario NUMBER,
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_estado CHAR
    );

        PROCEDURE eliminar_usuario(
        p_id_usuario NUMBER
    );

    --Procedimientos ofertas
     PROCEDURE crear_oferta(
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen VARCHAR2
    );

    PROCEDURE actualizar_oferta(
        p_id_ofertas NUMBER,
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen VARCHAR2
    );

    PROCEDURE eliminar_oferta(
        p_id_ofertas NUMBER
    );

END CRUD;

/
--------------------------------------------------------
--  DDL for Package FACTURACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE "ADM_PROYECTO_LBD"."FACTURACION" AS
     FUNCTION CalculaDescuento( 
        --recibe el total de la factura
        p_total_factura NUMBER,  
        --recibe el descuento a aplicar
        p_descuento_porcentaje NUMBER)RETURN DECIMAL;                                 



    FUNCTION CalculaTotalFactura(
        p_id_factura IN NUMBER  
        )RETURN NUMBER;



     PROCEDURE ActualizaTotalFactura(
        --Se recibe como parametro el id de la factura recientemente creada
        p_id_factura IN NUMBER);



    FUNCTION SumaTotalFacturas(p_id_usuario NUMBER)
    RETURN NUMBER;

    FUNCTION TotalVentasPorUbicacion(
    --Recibe por parametro 
    p_provincia IN VARCHAR2  
    )
    RETURN NUMBER;

END facturacion;

/
--------------------------------------------------------
--  DDL for Package Body CRUD
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ADM_PROYECTO_LBD"."CRUD" AS

    -- Procedimientos para Categoria
    PROCEDURE insertar_categoria(
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    ) IS
    BEGIN
        INSERT INTO Categoria (id_categoria, descripcion, activo)
        VALUES (SEQ_CATEGORIA.NEXTVAL, p_descripcion, NVL(p_activo, 'Y'));
    END insertar_categoria;

    PROCEDURE eliminar_categoria(
        p_id_categoria IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Categoria WHERE id_categoria = p_id_categoria;
    END eliminar_categoria;

    PROCEDURE modificar_categoria(
        p_id_categoria IN NUMBER,
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    ) IS
    BEGIN
        UPDATE Categoria
        SET descripcion = p_descripcion,
            activo = NVL(p_activo, 'Y')
        WHERE id_categoria = p_id_categoria;
    END modificar_categoria;

    -- Procedimientos para Producto
    PROCEDURE insertar_producto(
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_precio IN NUMBER,
        p_existencias IN NUMBER,
        p_activo IN CHAR,
        p_id_categoria IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Producto (
            id_producto, nombre, descripcion, precio, existencias, activo, id_categoria
        ) VALUES (
            SEQ_PRODUCTO.NEXTVAL, p_nombre, p_descripcion, p_precio, 
            NVL(p_existencias, 0), NVL(p_activo, 'Y'), p_id_categoria
        );
    END insertar_producto;

    PROCEDURE eliminar_producto(
        p_id_producto IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Producto WHERE id_producto = p_id_producto;
    END eliminar_producto;

    PROCEDURE modificar_producto(
        p_id_producto IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_precio IN NUMBER,
        p_existencias IN NUMBER,
        p_activo IN CHAR,
        p_id_categoria IN NUMBER
    ) IS
    BEGIN
        UPDATE Producto
        SET nombre = p_nombre,
            descripcion = p_descripcion,
            precio = p_precio,
            existencias = NVL(p_existencias, 0),
            activo = NVL(p_activo, 'Y'),
            id_categoria = p_id_categoria
        WHERE id_producto = p_id_producto;
    END modificar_producto;

    -- Procedimientos para Direccion

    PROCEDURE insertar_direccion(p_provincia VARCHAR2, p_ciudad VARCHAR2, p_ubicacion_exacta VARCHAR2, p_id_usuario NUMBER) IS
    BEGIN
        INSERT INTO Direccion (id_direccion, provincia, ciudad, ubicacion_exacta, id_usuario)
        VALUES (SEQ_DIRECCION.NEXTVAL, p_provincia, p_ciudad, p_ubicacion_exacta, p_id_usuario);
    END insertar_direccion;

    PROCEDURE eliminar_direccion(p_id_direccion NUMBER) IS
    BEGIN
        DELETE FROM Direccion WHERE id_direccion = p_id_direccion;
    END eliminar_direccion;

    PROCEDURE modificar_direccion(p_id_direccion NUMBER, p_provincia VARCHAR2, p_ciudad VARCHAR2, p_ubicacion_exacta VARCHAR2, p_id_usuario NUMBER) IS
    BEGIN
        UPDATE Direccion
        SET provincia = p_provincia,
            ciudad = p_ciudad,
            ubicacion_exacta = p_ubicacion_exacta,
            id_usuario = p_id_usuario
        WHERE id_direccion = p_id_direccion;
    END modificar_direccion;

-- Procedimientos para Telefono

    PROCEDURE insertar_telefono(p_numero_telefono VARCHAR2, p_id_usuario NUMBER) IS
    BEGIN
        INSERT INTO Telefono (id_telefono, numero_telefono, id_usuario)
        VALUES (SEQ_TELEFONO.NEXTVAL, p_numero_telefono, p_id_usuario);
    END insertar_telefono;

    PROCEDURE eliminar_telefono(p_id_telefono NUMBER) IS
    BEGIN
        DELETE FROM Telefono WHERE id_telefono = p_id_telefono;
    END eliminar_telefono;

    PROCEDURE modificar_telefono(p_id_telefono NUMBER, p_numero_telefono VARCHAR2, p_id_usuario NUMBER) IS
    BEGIN
        UPDATE Telefono
        SET numero_telefono = p_numero_telefono,
            id_usuario = p_id_usuario
        WHERE id_telefono = p_id_telefono;
    END modificar_telefono;

--Procedimiento usuarios
PROCEDURE crear_usuario(
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_activo CHAR
    ) IS
    BEGIN
        INSERT INTO Usuario (
            id_usuario, nombre_usuario, nombre, prim_apellido, seg_apellido,
            correo, contrasena, id_rol, activo
        ) VALUES (
            SEQ_USUARIO.NEXTVAL, p_nombre_usuario, p_nombre, p_prim_apellido, p_seg_apellido,
            p_correo, p_contrasena, p_id_rol, p_activo
        );
    END;
    PROCEDURE actualizar_usuario(
        p_id_usuario NUMBER,
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_estado CHAR
    ) IS

    BEGIN
        UPDATE Usuario
        SET nombre_usuario = p_nombre_usuario,
            nombre = p_nombre,
            prim_apellido = p_prim_apellido,
            seg_apellido = p_seg_apellido,
            correo = p_correo,
            contrasena = p_contrasena,
            id_rol = p_id_rol,
            activo = p_estado
        WHERE id_usuario = p_id_usuario;
    END;

        PROCEDURE eliminar_usuario(p_id_usuario NUMBER) IS
    BEGIN
        DELETE FROM Usuario
        WHERE id_usuario = p_id_usuario;
    END;

--Procedimiento Oferta 
    PROCEDURE crear_oferta(
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Ofertas (
            id_ofertas, nombre, descripcion, imagen, activo
        ) VALUES (
            SEQ_OFERTAS.NEXTVAL, p_nombre, p_descripcion, p_imagen, 'Y'
        );
    END;

    PROCEDURE actualizar_oferta(
        p_id_ofertas NUMBER,
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen VARCHAR2
    ) IS
    BEGIN
        UPDATE Ofertas
        SET nombre = p_nombre,
            descripcion = p_descripcion,
            imagen = p_imagen
        WHERE id_ofertas = p_id_ofertas;
    END;

    PROCEDURE eliminar_oferta(p_id_ofertas NUMBER) IS
    BEGIN
        DELETE FROM Ofertas
        WHERE id_ofertas = p_id_ofertas;
    END;
END CRUD;


/
--------------------------------------------------------
--  DDL for Package Body FACTURACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE PACKAGE BODY "ADM_PROYECTO_LBD"."FACTURACION" AS
    --Funcion para calcular el descuento de una factura.
    FUNCTION CalculaDescuento(
        --recibe el total de la factura
        p_total_factura NUMBER,  
        --recibe el descuento a aplicar
        p_descuento_porcentaje NUMBER   
        )
    RETURN DECIMAL
    IS
        --Almacenar el resultado a retornar
        v_total DECIMAL;  
    BEGIN


        --Calcular descuento
        v_total := p_total_factura - (p_total_factura * (p_descuento_porcentaje / 100));

        RETURN v_total;
    END CalculaDescuento;





    /*******************************************************************************************/
    --Con esta funcion calculamos el total de la factura utilizando la tabla detalle_factra
    FUNCTION CalculaTotalFactura(
    --Recibimos por parametro el id de la factura para recorrer la tabla 
    --detalle_factura, la cual contiene como FK el ID de factura
    p_id_factura IN NUMBER  
    )
    RETURN NUMBER
    IS
        --Declaramos las variables
        v_total NUMBER := 0;
        v_precio NUMBER;
        v_cantidad NUMBER;

        --Con este cursor recorremos las lineas que tienen el id Factura
        CURSOR cur_detalle_factura IS
            SELECT precio, cantidad
            FROM items_factura
            WHERE id_factura = p_id_factura;
    BEGIN

        OPEN cur_detalle_factura;
        LOOP
            FETCH cur_detalle_factura INTO v_precio, v_cantidad;

            --Sale de este loop cuando no hay mas lineas para el id_factura
            EXIT WHEN cur_detalle_factura%NOTFOUND;

            --Calculamos total por cada item y lo acumulamos en total
            v_total := v_total + (v_precio * v_cantidad);
        END LOOP;
        CLOSE cur_detalle_factura;
        RETURN v_total;
    END CalculaTotalFactura;



    /*******************************************************************************************/

    --Procedimiento utilizada para actualizar el total de la factura
    PROCEDURE ActualizaTotalFactura(
    --Se recibe como parametro el id de la factura recientemente creada
    p_id_factura IN NUMBER
    )
    IS
        v_total NUMBER;
    BEGIN

        v_total := CalculaTotalFactura(p_id_factura);
        UPDATE Factura
        SET total = v_total
        WHERE id_factura = p_id_factura;

        COMMIT;
    END ActualizaTotalFactura;


    /*******************************************************************************************/


    --Esta funcion se utiliza para poder obtener el total de las ventas por cliente
    FUNCTION SumaTotalFacturas(p_id_usuario NUMBER)
    RETURN NUMBER
    IS
        --variable para acumular los totales de las facturas
        v_total_facturas NUMBER := 0; 
        v_total NUMBER;
        CURSOR cur_total_factura IS
            SELECT total FROM vista_factura
            WHERE id_usuario = p_id_usuario;
    BEGIN
        OPEN cur_total_factura;

        -- recorrer la tabla y obtener el total de cada factura relacionada con el cliente
        LOOP
            FETCH cur_total_factura INTO v_total;

            -- Salir del loop si no hay más registros
            EXIT WHEN cur_total_factura%NOTFOUND;

            --calcular el total de las facturas
            v_total_facturas := v_total_facturas + v_total;
        END LOOP;

        -- Cerrar el cursor
        CLOSE cur_total_factura;

        -- Devolver el total acumulado
        RETURN v_total_facturas;
    END SumaTotalFacturas;


    /*******************************************************************************************/

--Esta funcion se utiliza para poder obtener el total de las ventas por cliente segun su ubicacion
    FUNCTION TotalVentasPorUbicacion(
    --Recibe por parametro 
    p_provincia IN VARCHAR2  
    )
    RETURN NUMBER
    IS

        v_total_venta NUMBER := 0;  
        v_factura_total NUMBER;      

        -- Definir el cursor
        CURSOR cur_facturas IS
            SELECT f.total
            FROM Factura f
            JOIN Usuario u ON f.id_usuario = u.id_usuario
            JOIN Direccion d ON u.id_usuario = d.id_usuario
            WHERE d.provincia = p_provincia;
    BEGIN

        OPEN cur_facturas;

        LOOP
            FETCH cur_facturas INTO v_factura_total;

            EXIT WHEN cur_facturas%NOTFOUND;

            v_total_venta := v_total_venta + v_factura_total;
        END LOOP;


        CLOSE cur_facturas;

        RETURN v_total_venta;
    END TotalVentasPorUbicacion;


END facturacion;

/
--------------------------------------------------------
--  DDL for Function CALCULADESCUENTO
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADM_PROYECTO_LBD"."CALCULADESCUENTO" (
    --recibe el total de la factura
    p_total_factura NUMBER,  
    --recibe el descuento a aplicar
    p_descuento_porcentaje NUMBER   
)
RETURN DECIMAL
IS
    --Almacenar el resultado a retornar
    v_total DECIMAL;  
BEGIN


    --Calcular descuento
    v_total := p_total_factura - (p_total_factura * (p_descuento_porcentaje / 100));

    RETURN v_total;
END;

/
--------------------------------------------------------
--  DDL for Function CALCULATOTALFACTURA
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADM_PROYECTO_LBD"."CALCULATOTALFACTURA" (
    --Recibimos por parametro el id de la factura para recorrer la tabla 
    --detalle_factura, la cual contiene como FK el ID de factura
    p_id_factura IN NUMBER  
)
RETURN NUMBER
IS
   --Declaramos las variables
    v_total NUMBER := 0;
    v_precio NUMBER;
    v_cantidad NUMBER;

    --Con este cursor recorremos las lineas que tienen el id Factura
    CURSOR cur_detalle_factura IS
        SELECT precio, cantidad
        FROM items_factura
        WHERE id_factura = p_id_factura;
BEGIN

    OPEN cur_detalle_factura;
    LOOP
        FETCH cur_detalle_factura INTO v_precio, v_cantidad;

       --Sale de este loop cuando no hay mas lineas para el id_factura
        EXIT WHEN cur_detalle_factura%NOTFOUND;

       --Calculamos total por cada item y lo acumulamos en total
        v_total := v_total + (v_precio * v_cantidad);
    END LOOP;
    CLOSE cur_detalle_factura;
    RETURN v_total;
END;

/
--------------------------------------------------------
--  DDL for Function SUMATOTALFACTURAS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADM_PROYECTO_LBD"."SUMATOTALFACTURAS" (p_id_usuario NUMBER)
RETURN NUMBER
IS
    --variable para acumular los totales de las facturas
    v_total_facturas NUMBER := 0; 
    v_total NUMBER;
    CURSOR cur_total_factura IS
        SELECT total FROM vista_factura
        WHERE id_usuario = p_id_usuario;
BEGIN
    OPEN cur_total_factura;

    -- recorrer la tabla y obtener el total de cada factura relacionada con el cliente
    LOOP
        FETCH cur_total_factura INTO v_total;

        -- Salir del loop si no hay más registros
        EXIT WHEN cur_total_factura%NOTFOUND;

        --calcular el total de las facturas
        v_total_facturas := v_total_facturas + v_total;
    END LOOP;

    -- Cerrar el cursor
    CLOSE cur_total_factura;

    -- Devolver el total acumulado
    RETURN v_total_facturas;
END;

/
--------------------------------------------------------
--  DDL for Function TOTALVENTASPORUBICACION
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE FUNCTION "ADM_PROYECTO_LBD"."TOTALVENTASPORUBICACION" (
    --Recibe por parametro 
    p_provincia IN VARCHAR2  
)
RETURN NUMBER
IS
  
    v_total_venta NUMBER := 0;  
    v_factura_total NUMBER;      

    -- Definir el cursor
    CURSOR cur_facturas IS
        SELECT f.total
        FROM Factura f
        JOIN Usuario u ON f.id_usuario = u.id_usuario
        JOIN Direccion d ON u.id_usuario = d.id_usuario
        WHERE d.provincia = p_provincia;
BEGIN

    OPEN cur_facturas;

    LOOP
        FETCH cur_facturas INTO v_factura_total;

        EXIT WHEN cur_facturas%NOTFOUND;

        v_total_venta := v_total_venta + v_factura_total;
    END LOOP;


    CLOSE cur_facturas;

    RETURN v_total_venta;
END;

/
--------------------------------------------------------
--  Constraints for Table V_PRODUCTOS
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."V_PRODUCTOS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."V_PRODUCTOS" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ADM_PROYECTO_LBD"."V_PRODUCTOS" MODIFY ("ID_PRODUCTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROL
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."ROL" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."ROL" ADD PRIMARY KEY ("ID_ROL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HISTORIAL_VENTAS
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."HISTORIAL_VENTAS" ADD PRIMARY KEY ("ID_HISTORIAL_VENTAS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DETALLE_FACTURA
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."DETALLE_FACTURA" MODIFY ("PRECIO" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."DETALLE_FACTURA" MODIFY ("CANTIDAD" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."DETALLE_FACTURA" MODIFY ("ID_FACTURA" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."DETALLE_FACTURA" MODIFY ("ID_PRODUCTO" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."DETALLE_FACTURA" ADD PRIMARY KEY ("ID_VENTA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table FACTURA
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."FACTURA" MODIFY ("ID_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."FACTURA" ADD PRIMARY KEY ("ID_FACTURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table OFERTAS
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."OFERTAS" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."OFERTAS" ADD PRIMARY KEY ("ID_OFERTAS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."USUARIO" MODIFY ("NOMBRE_USUARIO" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."USUARIO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."USUARIO" MODIFY ("PRIM_APELLIDO" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."USUARIO" MODIFY ("CORREO" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."USUARIO" MODIFY ("CONTRASENA" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."USUARIO" ADD PRIMARY KEY ("ID_USUARIO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ADM_PROYECTO_LBD"."USUARIO" ADD UNIQUE ("CORREO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TELEFONO
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."TELEFONO" MODIFY ("NUMERO_TELEFONO" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."TELEFONO" ADD PRIMARY KEY ("ID_TELEFONO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCTO
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."PRODUCTO" MODIFY ("NOMBRE" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."PRODUCTO" MODIFY ("PRECIO" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."PRODUCTO" MODIFY ("ID_CATEGORIA" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."PRODUCTO" ADD PRIMARY KEY ("ID_PRODUCTO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORIA
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."CATEGORIA" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."CATEGORIA" ADD PRIMARY KEY ("ID_CATEGORIA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table DIRECCION
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."DIRECCION" MODIFY ("PROVINCIA" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."DIRECCION" MODIFY ("CIUDAD" NOT NULL ENABLE);
  ALTER TABLE "ADM_PROYECTO_LBD"."DIRECCION" ADD PRIMARY KEY ("ID_DIRECCION")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DETALLE_FACTURA
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."DETALLE_FACTURA" ADD FOREIGN KEY ("ID_FACTURA")
	  REFERENCES "ADM_PROYECTO_LBD"."FACTURA" ("ID_FACTURA") ENABLE;
  ALTER TABLE "ADM_PROYECTO_LBD"."DETALLE_FACTURA" ADD FOREIGN KEY ("ID_PRODUCTO")
	  REFERENCES "ADM_PROYECTO_LBD"."PRODUCTO" ("ID_PRODUCTO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DIRECCION
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."DIRECCION" ADD FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "ADM_PROYECTO_LBD"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FACTURA
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."FACTURA" ADD FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "ADM_PROYECTO_LBD"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HISTORIAL_VENTAS
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."HISTORIAL_VENTAS" ADD FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "ADM_PROYECTO_LBD"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCTO
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."PRODUCTO" ADD FOREIGN KEY ("ID_CATEGORIA")
	  REFERENCES "ADM_PROYECTO_LBD"."CATEGORIA" ("ID_CATEGORIA") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TELEFONO
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."TELEFONO" ADD FOREIGN KEY ("ID_USUARIO")
	  REFERENCES "ADM_PROYECTO_LBD"."USUARIO" ("ID_USUARIO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table USUARIO
--------------------------------------------------------

  ALTER TABLE "ADM_PROYECTO_LBD"."USUARIO" ADD FOREIGN KEY ("ID_ROL")
	  REFERENCES "ADM_PROYECTO_LBD"."ROL" ("ID_ROL") ENABLE;
