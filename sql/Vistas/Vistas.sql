--VISTAS

--categoria
CREATE OR REPLACE VIEW v_categoria AS
SELECT id_categoria, descripcion, activo
FROM Categoria;

--producto
CREATE OR REPLACE VIEW v_producto AS
SELECT p.id_producto,p.nombre,p.descripcion,p.precio,p.existencias,p.activo,c.descripcion AS categoria
FROM Producto p
LEFT JOIN Categoria c ON p.id_categoria = c.id_categoria;


--direcciones
CREATE OR REPLACE VIEW v_direccion AS
SELECT d.id_direccion,d.provincia,d.ciudad,d.ubicacion_exacta,u.nombre_usuario AS usuario
FROM Direccion d
LEFT JOIN Usuario u ON d.id_usuario = u.id_usuario;

