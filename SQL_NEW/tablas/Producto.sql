CREATE TABLE Producto (
    id_producto NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(255),
    precio NUMBER(10, 2) NOT NULL,
    existencias NUMBER DEFAULT 0,
    estado CHAR(1) DEFAULT 'Y',
    id_categoria NUMBER NOT NULL REFERENCES Categoria(id_categoria)
);
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_producto AS
  SELECT p.id_producto,p.nombre,p.descripcion,p.precio,p.existencias,c.descripcion AS categoria,
    CASE 
        WHEN p.estado = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS estado
FROM Producto p
LEFT JOIN Categoria c ON p.id_categoria = c.id_categoria
SELECT * FROM v_producto;

--------------------------------------------------------------------------------
CREATE SEQUENCE seq_producto START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_producto_bi
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    IF :NEW.id_producto IS NULL THEN
        :NEW.id_producto := seq_producto.NEXTVAL;
    END IF;
END;
/