
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
--------------------------------------------------------------------------------
  CREATE OR REPLACE VIEW v_usuario AS
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
--------------------------------------------------------------------------------
CREATE SEQUENCE seq_usuario START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER trg_usuario_bi
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
    IF :NEW.id_usuario IS NULL THEN
        :NEW.id_usuario := seq_usuario.NEXTVAL;
    END IF;
END;
/