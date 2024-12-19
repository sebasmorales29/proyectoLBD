-- Secuencias de tablas 
CREATE SEQUENCE seq_categoria START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_producto START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_ofertas START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_rol START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_usuario START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_factura START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_detalle_factura START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE seq_historial_ventas START WITH 1 INCREMENT BY 1;

-- Triggers para asignar valores de secuencia automáticamente
-- Categoria
CREATE OR REPLACE TRIGGER trg_categoria_bi
BEFORE INSERT ON Categoria
FOR EACH ROW
BEGIN
    IF :NEW.id_categoria IS NULL THEN
    :NEW.id_categoria := seq_categoria.NEXTVAL;
    END IF;
END;



/

-- Producto
CREATE OR REPLACE TRIGGER trg_producto_bi
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF :NEW.id_producto IS NULL THEN
        :NEW.id_producto := seq_producto.NEXTVAL;
    END IF;
END;
/




-- Ofertas
CREATE OR REPLACE TRIGGER trg_ofertas_bi
BEFORE INSERT ON Ofertas
FOR EACH ROW
BEGIN
    IF :NEW.id_ofertas IS NULL THEN
    :NEW.id_ofertas := seq_ofertas.NEXTVAL;
    END IF;
END;


/

-- Rol
CREATE OR REPLACE TRIGGER trg_rol_bi
BEFORE INSERT ON Rol
FOR EACH ROW
BEGIN
    IF :NEW.id_rol IS NULL THEN
    :NEW.id_rol := seq_rol.NEXTVAL;
    END IF;
END;
/


-- Usuario
CREATE OR REPLACE TRIGGER trg_usuario_bi
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
    IF :NEW.id_usuario IS NULL THEN
        :NEW.id_usuario := seq_usuario.NEXTVAL;
    END IF;
END;
/


-- Factura
CREATE OR REPLACE TRIGGER trg_factura_bi
BEFORE INSERT ON Factura
FOR EACH ROW
BEGIN
    IF :NEW.id_factura IS NULL THEN
    :NEW.id_factura := seq_factura.NEXTVAL;
    END IF;
END;
/


    

-- Detalle_Factura
CREATE OR REPLACE TRIGGER trg_detalle_factura_bi
BEFORE INSERT ON Detalle_Factura
FOR EACH ROW
BEGIN
    IF :NEW.id_venta IS NULL THEN
    :NEW.id_venta := seq_detalle_factura.NEXTVAL;
    END IF;
END;
/

-- Historial_Ventas
CREATE OR REPLACE TRIGGER trg_historial_ventas_bi
BEFORE INSERT ON Historial_Ventas
FOR EACH ROW
BEGIN
    IF :NEW.id_historial_ventas IS NULL THEN
    :NEW.id_historial_ventas := seq_historial_ventas.NEXTVAL;
    END IF;
END;
/
