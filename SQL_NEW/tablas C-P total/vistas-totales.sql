-- Vista para el total de categorías
CREATE OR REPLACE VIEW v_total_categorias AS
SELECT COUNT(*) AS total_categorias
FROM Categoria;

-- Vista para el total de productos
CREATE OR REPLACE VIEW v_total_productos AS
SELECT COUNT(*) AS total_productos
FROM Producto;
