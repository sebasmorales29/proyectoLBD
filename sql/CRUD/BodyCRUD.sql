-- Body del paquete CRUD
CREATE OR REPLACE PACKAGE BODY CRUD AS

    -- Procedimientos para Categoria
    PROCEDURE insertar_categoria(
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    ) IS
    BEGIN
        INSERT INTO Categoria (id_categoria, descripcion, activo)
        VALUES (SEQ_CATEGORIA.NEXTVAL, p_descripcion, NVL(p_activo, 'Y'));
    END insertar_categoria;

    PROCEDURE eliminar_categoria(
        p_id_categoria IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Categoria WHERE id_categoria = p_id_categoria;
    END eliminar_categoria;

    PROCEDURE modificar_categoria(
        p_id_categoria IN NUMBER,
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    ) IS
    BEGIN
        UPDATE Categoria
        SET descripcion = p_descripcion,
            activo = NVL(p_activo, 'Y')
        WHERE id_categoria = p_id_categoria;
    END modificar_categoria;

    -- Procedimientos para Producto
    PROCEDURE insertar_producto(
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_precio IN NUMBER,
        p_existencias IN NUMBER,
        p_activo IN CHAR,
        p_id_categoria IN NUMBER
    ) IS
    BEGIN
        INSERT INTO Producto (
            id_producto, nombre, descripcion, precio, existencias, activo, id_categoria
        ) VALUES (
            SEQ_PRODUCTO.NEXTVAL, p_nombre, p_descripcion, p_precio, 
            NVL(p_existencias, 0), NVL(p_activo, 'Y'), p_id_categoria
        );
    END insertar_producto;

    PROCEDURE eliminar_producto(
        p_id_producto IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Producto WHERE id_producto = p_id_producto;
    END eliminar_producto;

    PROCEDURE modificar_producto(
        p_id_producto IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_precio IN NUMBER,
        p_existencias IN NUMBER,
        p_activo IN CHAR,
        p_id_categoria IN NUMBER
    ) IS
    BEGIN
        UPDATE Producto
        SET nombre = p_nombre,
            descripcion = p_descripcion,
            precio = p_precio,
            existencias = NVL(p_existencias, 0),
            activo = NVL(p_activo, 'Y'),
            id_categoria = p_id_categoria
        WHERE id_producto = p_id_producto;
    END modificar_producto;

    -- Procedimientos para Direccion

    PROCEDURE insertar_direccion(p_provincia VARCHAR2, p_ciudad VARCHAR2, p_ubicacion_exacta VARCHAR2, p_id_usuario NUMBER) IS
    BEGIN
        INSERT INTO Direccion (id_direccion, provincia, ciudad, ubicacion_exacta, id_usuario)
        VALUES (SEQ_DIRECCION.NEXTVAL, p_provincia, p_ciudad, p_ubicacion_exacta, p_id_usuario);
    END insertar_direccion;

    PROCEDURE eliminar_direccion(p_id_direccion NUMBER) IS
    BEGIN
        DELETE FROM Direccion WHERE id_direccion = p_id_direccion;
    END eliminar_direccion;

    PROCEDURE modificar_direccion(p_id_direccion NUMBER, p_provincia VARCHAR2, p_ciudad VARCHAR2, p_ubicacion_exacta VARCHAR2, p_id_usuario NUMBER) IS
    BEGIN
        UPDATE Direccion
        SET provincia = p_provincia,
            ciudad = p_ciudad,
            ubicacion_exacta = p_ubicacion_exacta,
            id_usuario = p_id_usuario
        WHERE id_direccion = p_id_direccion;
    END modificar_direccion;

-- Procedimientos para Telefono

    PROCEDURE insertar_telefono(p_numero_telefono VARCHAR2, p_id_usuario NUMBER) IS
    BEGIN
        INSERT INTO Telefono (id_telefono, numero_telefono, id_usuario)
        VALUES (SEQ_TELEFONO.NEXTVAL, p_numero_telefono, p_id_usuario);
    END insertar_telefono;

    PROCEDURE eliminar_telefono(p_id_telefono NUMBER) IS
    BEGIN
        DELETE FROM Telefono WHERE id_telefono = p_id_telefono;
    END eliminar_telefono;

    PROCEDURE modificar_telefono(p_id_telefono NUMBER, p_numero_telefono VARCHAR2, p_id_usuario NUMBER) IS
    BEGIN
        UPDATE Telefono
        SET numero_telefono = p_numero_telefono,
            id_usuario = p_id_usuario
        WHERE id_telefono = p_id_telefono;
    END modificar_telefono;

END CRUD;


