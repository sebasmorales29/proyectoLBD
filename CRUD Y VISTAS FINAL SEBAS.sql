/*CREAR PAQUETE PARA CRUD DE USUARIO*/
CREATE OR REPLACE PACKAGE pkg_usuario AS
    PROCEDURE crear_usuario(
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_id_direccion NUMBER,
        p_id_telefono NUMBER
    );

    PROCEDURE leer_usuario(
        p_id_usuario NUMBER
    );

    PROCEDURE actualizar_usuario(
        p_id_usuario NUMBER,
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_id_direccion NUMBER,
        p_id_telefono NUMBER
    );

    PROCEDURE eliminar_usuario(
        p_id_usuario NUMBER
    );
END pkg_usuario;
/

/*IMPLEMENTAR EL PAQUETE DEL CRUD DE USUARIO*/
CREATE OR REPLACE PACKAGE BODY pkg_usuario AS
    -- Crear usuario
    PROCEDURE crear_usuario(
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_id_direccion NUMBER,
        p_id_telefono NUMBER
    ) IS
    BEGIN
        INSERT INTO Usuario (
            id_usuario, nombre_usuario, nombre, prim_apellido, seg_apellido,
            correo, contrasena, id_rol, id_direccion, id_telefono, activo
        ) VALUES (
            SEQ_USUARIO.NEXTVAL, p_nombre_usuario, p_nombre, p_prim_apellido, p_seg_apellido,
            p_correo, p_contrasena, p_id_rol, p_id_direccion, p_id_telefono, 'Y'
        );
    END;

    -- Leer usuario
    PROCEDURE leer_usuario(p_id_usuario NUMBER) IS
        v_usuario Usuario%ROWTYPE;
    BEGIN
        SELECT * INTO v_usuario
        FROM Usuario
        WHERE id_usuario = p_id_usuario;

        DBMS_OUTPUT.PUT_LINE('ID Usuario: ' || v_usuario.id_usuario);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_usuario.nombre);
        DBMS_OUTPUT.PUT_LINE('Correo: ' || v_usuario.correo);
    END;

    -- Actualizar usuario
    PROCEDURE actualizar_usuario(
        p_id_usuario NUMBER,
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_id_direccion NUMBER,
        p_id_telefono NUMBER
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
            id_direccion = p_id_direccion,
            id_telefono = p_id_telefono
        WHERE id_usuario = p_id_usuario;
    END;

    -- Eliminar usuario
    PROCEDURE eliminar_usuario(p_id_usuario NUMBER) IS
    BEGIN
        DELETE FROM Usuario
        WHERE id_usuario = p_id_usuario;
    END;
END pkg_usuario;
/

/*CREAR PAQUETE PARA CRUD DE OFERTAS*/
CREATE OR REPLACE PACKAGE pkg_ofertas AS
    PROCEDURE crear_oferta(
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen BLOB
    );

    PROCEDURE leer_oferta(
        p_id_ofertas NUMBER
    );

    PROCEDURE actualizar_oferta(
        p_id_ofertas NUMBER,
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen BLOB
    );

    PROCEDURE eliminar_oferta(
        p_id_ofertas NUMBER
    );
END pkg_ofertas;
/

/*IMPLEMENTAR PAQUETE DE CRUD DE OFERTAS*/
CREATE OR REPLACE PACKAGE BODY pkg_ofertas AS
    -- Crear oferta
    PROCEDURE crear_oferta(
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen BLOB
    ) IS
    BEGIN
        INSERT INTO Ofertas (
            id_ofertas, nombre, descripcion, imagen, activo
        ) VALUES (
            SEQ_OFERTAS.NEXTVAL, p_nombre, p_descripcion, p_imagen, 'Y'
        );
    END;

    -- Leer oferta
    PROCEDURE leer_oferta(p_id_ofertas NUMBER) IS
        v_oferta Ofertas%ROWTYPE;
    BEGIN
        SELECT * INTO v_oferta
        FROM Ofertas
        WHERE id_ofertas = p_id_ofertas;

        DBMS_OUTPUT.PUT_LINE('ID Oferta: ' || v_oferta.id_ofertas);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_oferta.nombre);
        DBMS_OUTPUT.PUT_LINE('Descripción: ' || v_oferta.descripcion);
    END;

    -- Actualizar oferta
    PROCEDURE actualizar_oferta(
        p_id_ofertas NUMBER,
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen BLOB
    ) IS
    BEGIN
        UPDATE Ofertas
        SET nombre = p_nombre,
            descripcion = p_descripcion,
            imagen = p_imagen
        WHERE id_ofertas = p_id_ofertas;
    END;

    -- Eliminar oferta
    PROCEDURE eliminar_oferta(p_id_ofertas NUMBER) IS
    BEGIN
        DELETE FROM Ofertas
        WHERE id_ofertas = p_id_ofertas;
    END;
END pkg_ofertas;
/


-- Log para la tabla Usuario
CREATE MATERIALIZED VIEW LOG ON Usuario
WITH PRIMARY KEY
INCLUDING NEW VALUES;

-- Log para la tabla Categoria
CREATE MATERIALIZED VIEW LOG ON Categoria
WITH PRIMARY KEY
INCLUDING NEW VALUES;

-- Log para la tabla Producto
CREATE MATERIALIZED VIEW LOG ON Producto
WITH PRIMARY KEY
INCLUDING NEW VALUES;

/*VISTAS MATERIALIZADAS*/
CREATE MATERIALIZED VIEW lista_usuarios
BUILD IMMEDIATE
REFRESH FAST ON COMMIT
AS
SELECT 
    id_usuario, 
    nombre_usuario, 
    nombre, 
    prim_apellido, 
    correo, 
    activo
FROM Usuario;

CREATE MATERIALIZED VIEW lista_categorias
BUILD IMMEDIATE
REFRESH FAST ON COMMIT
AS
SELECT 
    id_categoria, 
    descripcion, 
    activo
FROM Categoria;

CREATE MATERIALIZED VIEW lista_productos
BUILD IMMEDIATE
REFRESH FAST ON COMMIT
AS
SELECT 
    id_producto, 
    nombre, 
    descripcion, 
    precio, 
    existencias, 
    activo
FROM Producto;