--paquete

-- Especificaci�n del paquete CRUD
CREATE OR REPLACE PACKAGE CRUD AS
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

    -- Procedimientos para Producto
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
    -- Procedimientos para Direccion
    PROCEDURE insertar_direccion(
    p_provincia VARCHAR2,
    p_ciudad VARCHAR2,
    p_ubicacion_exacta VARCHAR2,
    p_id_usuario NUMBER
    );
    PROCEDURE eliminar_direccion(
    p_id_direccion NUMBER
    );
    PROCEDURE modificar_direccion(
    p_id_direccion NUMBER,
    p_provincia VARCHAR2,
    p_ciudad VARCHAR2,
    p_ubicacion_exacta VARCHAR2,
    p_id_usuario NUMBER
    );

    -- Procedimientos para Telefono
    PROCEDURE insertar_telefono(
    p_numero_telefono VARCHAR2,
    p_id_usuario NUMBER
    );
    PROCEDURE eliminar_telefono(
    p_id_telefono NUMBER
    );
    PROCEDURE modificar_telefono(
    p_id_telefono NUMBER,
    p_numero_telefono VARCHAR2,
    p_id_usuario NUMBER
    );
    
    --Procedimientos usuario
        PROCEDURE crear_usuario(
        p_nombre_usuario VARCHAR2,
        p_nombre VARCHAR2,
        p_prim_apellido VARCHAR2,
        p_seg_apellido VARCHAR2,
        p_correo VARCHAR2,
        p_contrasena VARCHAR2,
        p_id_rol NUMBER,
        p_activo CHAR
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
        p_estado CHAR
    );
    
        PROCEDURE eliminar_usuario(
        p_id_usuario NUMBER
    );
    
    --Procedimientos ofertas
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
    
END CRUD;
/

