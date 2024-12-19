

CREATE TABLE Ofertas (
    id_ofertas NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion VARCHAR2(255),
    imagen VARCHAR2 (255),
    estado CHAR(1) DEFAULT 'Y');

--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_ofertas AS
  SELECT 
    id_ofertas,
    nombre,
    descripcion,
    imagen,
    CASE 
        WHEN estado = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS estado
FROM 
    Ofertas
;
--------------------------------------------------------------------------------

CREATE SEQUENCE seq_ofertas START WITH 1 INCREMENT BY 1;
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
