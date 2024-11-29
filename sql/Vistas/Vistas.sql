--VISTAS

--categoria
CREATE OR REPLACE VIEW v_categoria AS
SELECT id_categoria, descripcion,
    CASE 
        WHEN activo = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS estado
FROM Categoria;
/
--producto
CREATE OR REPLACE VIEW v_producto AS
SELECT p.id_producto,p.nombre,p.descripcion,p.precio,p.existencias,c.descripcion AS categoria,
    CASE 
        WHEN p.activo = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS estado
FROM Producto p
LEFT JOIN Categoria c ON p.id_categoria = c.id_categoria;
/
--direcciones
CREATE OR REPLACE VIEW v_direccion AS
SELECT d.id_direccion,d.provincia,d.ciudad,d.ubicacion_exacta,u.nombre_usuario AS usuario
FROM Direccion d
LEFT JOIN Usuario u ON d.id_usuario = u.id_usuario;
/
--Telfono
CREATE OR REPLACE VIEW v_telefonos AS
SELECT 
    t.id_telefono,
    t.numero_telefono,
    r.nombre AS rol
FROM 
    Telefono t
LEFT JOIN 
    Usuario u ON t.id_usuario = u.id_usuario
LEFT JOIN 
    Rol r ON u.id_rol = r.id_rol;
/
--Usuarios
CREATE OR REPLACE VIEW v_usuario AS
SELECT 
    u.id_usuario,
    u.nombre_usuario,
    u.nombre,
    u.prim_apellido,
    u.seg_apellido,
    u.correo,
    u.id_rol,
    r.nombre AS rol,
    CASE 
        WHEN u.activo = 'Y' THEN 'Activa'
    ELSE 'Inactiva'
END AS estado
FROM 
    Usuario u
LEFT JOIN Rol r ON u.id_rol = r.id_rol;
/
--Ofertas
CREATE OR REPLACE VIEW v_ofertas AS
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
    Ofertas;
