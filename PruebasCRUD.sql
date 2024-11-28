--Bloques anonimos pruebas 

--prueba categoria
DECLARE

    v_id_categoria NUMBER;
    v_descripcion_categoria VARCHAR2(255);
    v_activo_categoria CHAR(1);

    v_id_producto NUMBER;
    v_nombre_producto VARCHAR2(100);
    v_precio_producto NUMBER(10, 2);
    v_categoria_producto VARCHAR2(255);
BEGIN

    DBMS_OUTPUT.PUT_LINE('Resultados de la vista v_categoria:');
    FOR cat IN (SELECT * FROM v_categoria) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Categoria: ' || cat.id_categoria ||
                             ', Descripcion: ' || cat.descripcion ||
                             ', Activo: ' || cat.activo);
    END LOOP;
    end;
    
--prueba productos 
DECLARE
    
    v_id_producto NUMBER;
    v_nombre_producto VARCHAR2(100);
    v_descripcion_producto VARCHAR2(255);
    v_precio_producto NUMBER(10, 2);
    v_existencias_producto NUMBER;
    v_activo_producto CHAR(1);
    v_categoria_producto VARCHAR2(255);
BEGIN

    DBMS_OUTPUT.PUT_LINE('Listado de productos desde v_producto:');
    FOR prod IN (SELECT * FROM v_producto) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Producto: ' || prod.id_producto ||
                             ', Nombre: ' || prod.nombre ||
                             ', Descripcion: ' || NVL(prod.descripcion, 'N/A') ||
                             ', Precio: ' || prod.precio ||
                             ', Existencias: ' || prod.existencias ||
                             ', Activo: ' || prod.activo ||
                             ', Categoria: ' || NVL(prod.categoria, 'Sin categoría'));
    END LOOP;
END;

--prueba direccion
DECLARE
    
    v_id_direccion NUMBER;
    v_provincia VARCHAR2(100);
    v_ciudad VARCHAR2(100);
    v_ubicacion_exacta VARCHAR2(255);
    v_usuario VARCHAR2(50);
BEGIN

    DBMS_OUTPUT.PUT_LINE('Listado de direcciones desde v_direccion:');
    FOR dir IN (SELECT * FROM v_direccion) LOOP
        DBMS_OUTPUT.PUT_LINE('ID Dirección: ' || dir.id_direccion ||
                             ', Provincia: ' || dir.provincia ||
                             ', Ciudad: ' || dir.ciudad ||
                             ', Ubicación Exacta: ' || NVL(dir.ubicacion_exacta, 'N/A') ||
                             ', Usuario: ' || NVL(dir.usuario, 'Sin usuario'));
    END LOOP;
END;