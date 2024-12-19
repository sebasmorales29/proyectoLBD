CREATE OR REPLACE PACKAGE CRUD AS
--------------------------------------------------------------------------------
-- Procedimientos para Ofertas
    PROCEDURE crear_oferta(
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen VARCHAR2
    );

    PROCEDURE actualizar_oferta(
        p_id_ofertas NUMBER,
        p_nombre VARCHAR2,
        p_descripcion VARCHAR2,
        p_imagen VARCHAR2
    );

    PROCEDURE eliminar_oferta(
        p_id_ofertas NUMBER
    );
-------------------------------------------------------------------------------
-- Procedimientos para Categoria
    PROCEDURE insertar_categoria(
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    );

    PROCEDURE eliminar_categoria(
        p_id_categoria IN NUMBER
    );

    PROCEDURE modificar_categoria(
        p_id_categoria IN NUMBER,
        p_descripcion IN VARCHAR2,
        p_activo IN CHAR
    );
-------------------------------------------------------------------------------
    PROCEDURE insertar_producto(
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_precio IN NUMBER,
        p_existencias IN NUMBER,
        p_activo IN CHAR,
        p_id_categoria IN NUMBER
    );

    PROCEDURE eliminar_producto(
        p_id_producto IN NUMBER
    );

    PROCEDURE modificar_producto(
        p_id_producto IN NUMBER,
        p_nombre IN VARCHAR2,
        p_descripcion IN VARCHAR2,
        p_precio IN NUMBER,
        p_existencias IN NUMBER,
        p_activo IN CHAR,
        p_id_categoria IN NUMBER
    );
-------------------------------------------------------------------------------
    --Procedimientos rol
        PROCEDURE insertar_rol(
        p_nombre IN VARCHAR2);
        
        PROCEDURE eliminar_rol(
        p_id_rol IN NUMBER);
        
        PROCEDURE modificar_rol(
        p_id_rol IN NUMBER, 
        p_nombre IN VARCHAR2
    );
    
-------------------------------------------------------------------------------  
--Procedimientos usuario
        PROCEDURE crear_usuario(
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_activo IN CHAR
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
        p_activo IN CHAR
    );

        PROCEDURE eliminar_usuario(
        p_id_usuario NUMBER
    );
-------------------------------------------------------------------------------    
END CRUD;