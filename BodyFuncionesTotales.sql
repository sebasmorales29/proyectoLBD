CREATE OR REPLACE PACKAGE BODY funciones_totales AS

    FUNCTION contar_categorias RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Categoria;
        RETURN v_total;
    END contar_categorias;

    FUNCTION contar_productos RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total FROM Producto;
        RETURN v_total;
    END contar_productos;

END funciones_totales;
/
