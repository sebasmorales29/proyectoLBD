CREATE OR REPLACE PACKAGE BODY CRUD AS
--------------------------------------------------------------------------------
-- Procedimientos para Ofertas
    PROCEDURE crear_oferta(
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Ofertas (
            id_ofertas, nombre, descripcion, imagen
        ) VALUES (
            SEQ_OFERTAS.NEXTVAL, p_nombre, p_descripcion, p_imagen
        );
    END;

    PROCEDURE actualizar_oferta(
        p_id_ofertas NUMBER,
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen VARCHAR2
    ) IS
    BEGIN
        UPDATE Ofertas
        SET nombre = p_nombre,
            descripcion = p_descripcion,
            imagen = p_imagen
        WHERE id_ofertas = p_id_ofertas;
    END;

    PROCEDURE eliminar_oferta(p_id_ofertas NUMBER) IS
    BEGIN
        DELETE FROM Ofertas
        WHERE id_ofertas = p_id_ofertas;
    END;
--------------------------------------------------------------------------------
-- Procedimientos para Categoria
    PROCEDURE insertar_categoria(
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    ) IS
    BEGIN
        INSERT INTO Categoria (id_categoria, descripcion, estado)
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
            estado = NVL(p_activo, 'Y')
        WHERE id_categoria = p_id_categoria;
    END modificar_categoria;
--------------------------------------------------------------------------------
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
            id_producto, nombre, descripcion, precio, existencias, estado, id_categoria
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
            estado = NVL(p_activo, 'Y'),
            id_categoria = p_id_categoria
        WHERE id_producto = p_id_producto;
    END modificar_producto;
--------------------------------------------------------------------------------
    PROCEDURE insertar_rol(
        p_nombre IN VARCHAR2
    ) IS
    BEGIN
        INSERT INTO Rol (id_rol, nombre)
        VALUES (SEQ_ROL.NEXTVAL, p_nombre);
    END insertar_rol;

    PROCEDURE eliminar_rol(
        p_id_rol IN NUMBER
    ) IS
    BEGIN
        DELETE FROM Rol WHERE id_rol = p_id_rol;
    END eliminar_rol;

    PROCEDURE modificar_rol(
        p_id_rol IN NUMBER,
        p_nombre IN VARCHAR2
 
    ) IS
    BEGIN
        UPDATE Rol
        SET nombre= p_nombre
        WHERE id_rol = p_id_rol;
    END modificar_rol;
--------------------------------------------------------------------------------
-- Procedimientos para Usuario
PROCEDURE crear_usuario(
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_activo IN CHAR
    ) IS
    BEGIN
        INSERT INTO Usuario (
            id_usuario, nombre_usuario, nombre, prim_apellido, seg_apellido,
            correo, contrasena, id_rol, activo
        ) VALUES (
            SEQ_USUARIO.NEXTVAL, p_nombre_usuario, p_nombre, p_prim_apellido, p_seg_apellido,
            p_correo, p_contrasena, p_id_rol, NVL(p_activo, 'Y')
        );
    END;

    PROCEDURE actualizar_usuario(
        p_id_usuario NUMBER,
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_activo IN CHAR
    ) IS
    BEGIN
        UPDATE Usuario
        SET nombre_usuario = p_nombre_usuario,
            nombre = p_nombre,
            prim_apellido = p_prim_apellido,
            seg_apellido = p_seg_apellido,
            correo = p_correo,
            contrasena = p_contrasena,
            id_rol = p_id_rol,
            activo = NVL(p_activo, 'Y')
        WHERE id_usuario = p_id_usuario;
    END;

    PROCEDURE eliminar_usuario(p_id_usuario NUMBER) IS
    BEGIN
        DELETE FROM Usuario
        WHERE id_usuario = p_id_usuario;
    END;
--------------------------------------------------------------------------------
END CRUD;