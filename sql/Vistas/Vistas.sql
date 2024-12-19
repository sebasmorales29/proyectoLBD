--VISTAS

CREATE OR REPLACE VIEW v_categoria AS
SELECT id_categoria, descripcion, activo
FROM Categoria;





CREATE OR REPLACE VIEW v_producto AS
SELECT 
    p.id_producto, 
    p.nombre, 
    p.descripcion, 
    p.precio, 
    p.existencias, 
    p.id_categoria, 
    CASE 
        WHEN p.activo = 'Y' THEN 'Activa'
        ELSE 'Inactiva'
    END AS activo,
    c.descripcion AS categoria -- Alias para la categoría
FROM Producto p
JOIN categoria c ON p.id_categoria = c.id_categoria;





CREATE OR REPLACE VIEW v_ofertas AS
SELECT id_ofertas, nombre, descripcion, activo
FROM Ofertas;






CREATE OR REPLACE VIEW v_rol AS
SELECT id_rol, nombre
FROM Rol;

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
    rol r ON u.id_rol = r.id_rol;

CREATE OR REPLACE VIEW v_factura AS
SELECT id_factura, fecha, total, id_usuario
FROM Factura;

CREATE OR REPLACE VIEW v_detalle_factura AS
SELECT id_venta, precio, cantidad, id_factura, id_producto
FROM Detalle_Factura;

CREATE OR REPLACE VIEW v_historial_ventas AS
SELECT id_historial_ventas, fecha_venta, id_usuario
FROM Historial_Ventas;