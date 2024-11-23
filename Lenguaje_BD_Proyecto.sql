/*Creacion del Archivo SQL*/
/*Pizza la zompopa*/
/*
1. Tabla usuarios
* Atributos:
    * id_usuario (INT, PRIMARY KEY)
    * nombre (VARCHAR(100))
    * apellido (VARCHAR(100))
    * correo (VARCHAR(150), UNIQUE)
    * contraseña (VARCHAR(256))
    * rol (VARCHAR(50))
    * fecha_creacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
    * fecha_modificacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

2. Tabla roles
* Atributos:
    * id_rol (INT, PRIMARY KEY)
    * nombre_rol (VARCHAR(50), UNIQUE)
    * permisos (VARCHAR(255))

3. Tabla clientes
* Atributos:
    * id_cliente (INT, PRIMARY KEY)
    * id_usuario (INT, UNIQUE, FOREIGN KEY REFERENCES usuarios(id_usuario))
    * fecha_creacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
    * fecha_modificacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

4. Tabla empleados
* Atributos:
    * id_empleado (INT, PRIMARY KEY)
    * id_usuario (INT, UNIQUE, FOREIGN KEY REFERENCES usuarios(id_usuario))
    * id_sucursal (INT, FOREIGN KEY REFERENCES sucursales(id_sucursal))
    * cargo (VARCHAR(100))
    * fecha_contratacion (DATE)

5. Tabla sucursales
* Atributos:
    * id_sucursal (INT, PRIMARY KEY)
    * nombre_sucursal (VARCHAR(100))
    * direccion (VARCHAR(255))
    * fecha_creacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
    * fecha_modificacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

6. Tabla productos
* Atributos:
    * id_producto (INT, PRIMARY KEY)
    * nombre_producto (VARCHAR(100))
    * precio (DECIMAL(10, 2))
    * cantidad_disponible (INT)
    * fecha_ultima_actualizacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

7. Tabla inventario
* Atributos:
    * id_inventario (INT, PRIMARY KEY)
    * id_producto (INT, FOREIGN KEY REFERENCES productos(id_producto))
    * cantidad (INT)
    * fecha_entrada (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

8. Tabla pedidos
* Atributos:
    * id_pedido (INT, PRIMARY KEY)
    * id_cliente (INT, FOREIGN KEY REFERENCES clientes(id_cliente))
    * fecha_pedido (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
    * estado (VARCHAR(50))

9. Tabla detalle_pedido
* Atributos:
    * id_detalle (INT, PRIMARY KEY)
    * id_pedido (INT, FOREIGN KEY REFERENCES pedidos(id_pedido))
    * id_producto (INT, FOREIGN KEY REFERENCES productos(id_producto))
    * cantidad (INT)
    * precio_unitario (DECIMAL(10, 2))

10. Tabla promociones
* Atributos:
    * id_promocion (INT, PRIMARY KEY)
    * descripcion (VARCHAR(255))
    * descuento (DECIMAL(5, 2))
    * fecha_inicio (DATE)
    * fecha_fin (DATE)
    * id_producto (INT, FOREIGN KEY REFERENCES productos(id_producto))

11. Tabla log_actividades
* Atributos:
    * id_log (INT, PRIMARY KEY)
    * id_usuario (INT, FOREIGN KEY REFERENCES usuarios(id_usuario))
    * accion (VARCHAR(255))
    * descripcion (TEXT)
    * fecha (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

12. Tabla telefonos
* Atributos:
    * id_telefono (INT, PRIMARY KEY)
    * id_cliente (INT, FOREIGN KEY REFERENCES clientes(id_cliente))
    * id_empleado (INT, FOREIGN KEY REFERENCES empleados(id_empleado))
    * numero (VARCHAR(15))
    * tipo (VARCHAR(50))
    * fecha_creacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
    * fecha_modificacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)

13. Tabla direcciones
* Atributos:
    * id_direccion (INT, PRIMARY KEY)
    * id_cliente (INT, FOREIGN KEY REFERENCES clientes(id_cliente))
    * id_empleado (INT, FOREIGN KEY REFERENCES empleados(id_empleado))
    * direccion (VARCHAR(255))
    * tipo (VARCHAR(50))
    * fecha_creacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
    * fecha_modificacion (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)
    
*/




-- Tabla usuarios
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    correo VARCHAR(150) UNIQUE,
    contraseña VARCHAR(256),
    rol VARCHAR(50),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla roles
CREATE TABLE roles (
    id_rol INT PRIMARY KEY,
    nombre_rol VARCHAR(50) UNIQUE,
    permisos VARCHAR(255)
);

-- Tabla clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    id_usuario INT UNIQUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla empleados
CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    id_usuario INT UNIQUE,
    id_sucursal INT,
    cargo VARCHAR(100),
    fecha_contratacion DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);

-- Tabla sucursales
CREATE TABLE sucursales (
    id_sucursal INT PRIMARY KEY,
    nombre_sucursal VARCHAR(100),
    direccion VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla productos
CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio DECIMAL(10, 2),
    cantidad_disponible INT,
    fecha_ultima_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla inventario
CREATE TABLE inventario (
    id_inventario INT PRIMARY KEY,
    id_producto INT,
    cantidad INT,
    fecha_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Tabla pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabla detalle_pedido
CREATE TABLE detalle_pedido (
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Tabla promociones
CREATE TABLE promociones (
    id_promocion INT PRIMARY KEY,
    descripcion VARCHAR(255),
    descuento DECIMAL(5, 2),
    fecha_inicio DATE,
    fecha_fin DATE,
    id_producto INT,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- Tabla log_actividades
CREATE TABLE log_actividades (
    id_log INT PRIMARY KEY,
    id_usuario INT,
    accion VARCHAR(255),
    descripcion TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla telefonos
CREATE TABLE telefonos (
    id_telefono INT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    numero VARCHAR(15),
    tipo VARCHAR(50),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);

-- Tabla direcciones
CREATE TABLE direcciones (
    id_direccion INT PRIMARY KEY,
    id_cliente INT,
    id_empleado INT,
    direccion VARCHAR(255),
    tipo VARCHAR(50),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_modificacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado)
);
