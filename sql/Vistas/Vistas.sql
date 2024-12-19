--VISTAS

CREATE OR REPLACE VIEW v_categoria AS
SELECT id_categoria, descripcion, activo
FROM Categoria;

CREATE OR REPLACE VIEW v_producto AS
SELECT id_producto, nombre, descripcion, precio, existencias, activo, id_categoria
FROM Producto;

CREATE OR REPLACE VIEW v_ofertas AS
SELECT id_ofertas, nombre, descripcion, activo
FROM Ofertas;

CREATE OR REPLACE VIEW v_rol AS
SELECT id_rol, nombre
FROM Rol;

CREATE OR REPLACE VIEW v_usuario AS
SELECT id_usuario, nombre_usuario, nombre, prim_apellido, seg_apellido, correo, id_rol, activo
FROM Usuario;

CREATE OR REPLACE VIEW v_factura AS
SELECT id_factura, fecha, total, id_usuario
FROM Factura;

CREATE OR REPLACE VIEW v_detalle_factura AS
SELECT id_venta, precio, cantidad, id_factura, id_producto
FROM Detalle_Factura;

CREATE OR REPLACE VIEW v_historial_ventas AS
SELECT id_historial_ventas, fecha_venta, id_usuario
FROM Historial_Ventas;