--Prueba conteo de productos y categorias

DECLARE
    total_categorias NUMBER;
    total_productos NUMBER;
BEGIN
    total_categorias := funciones_totales.contar_categorias();
    total_productos := funciones_totales.contar_productos();
    
    DBMS_OUTPUT.PUT_LINE('Total de Categorías: ' || total_categorias);
    DBMS_OUTPUT.PUT_LINE('Total de Productos: ' || total_productos);
END;
/
