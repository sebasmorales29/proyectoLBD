CREATE TABLE Categoria (
    id_categoria NUMBER PRIMARY KEY,
    descripcion VARCHAR2(255) NOT NULL,
    estado CHAR(1) DEFAULT 'Y'
);
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_categoria AS
  SELECT id_categoria, descripcion,
    CASE 
        WHEN estado = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS estado
FROM Categoria
;
--------------------------------------------------------------------------------
CREATE SEQUENCE seq_categoria START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_categoria_bi
BEFORE INSERT ON Categoria
FOR EACH ROW
BEGIN
    IF :NEW.id_categoria IS NULL THEN
    :NEW.id_categoria := seq_categoria.NEXTVAL;
    END IF;
END;
/