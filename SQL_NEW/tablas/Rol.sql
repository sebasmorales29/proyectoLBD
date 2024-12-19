
CREATE TABLE Rol (
    id_rol NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL
);
--------------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_rol AS
SELECT id_rol, nombre
FROM Rol;
--------------------------------------------------------------------------------
CREATE SEQUENCE seq_rol START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_rol_bi
BEFORE INSERT ON Rol
FOR EACH ROW
BEGIN
    IF :NEW.id_rol IS NULL THEN
    :NEW.id_rol := seq_rol.NEXTVAL;
    END IF;
END;
/