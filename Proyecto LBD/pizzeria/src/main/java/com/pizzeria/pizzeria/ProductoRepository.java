package com.pizzeria.pizzeria;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductoRepository extends JpaRepository<Producto, Long> {

    @Query(value = "{CALL CRUD.INSERTAR_PRODUCTO(:nombre, :descripcion, :precio, :existencias, :activo, :id_categoria)}", nativeQuery = true)
    void agregarProducto(@Param("nombre") String nombre, @Param("descripcion") String descripcion, @Param("precio") Double precio, @Param("existencias") Integer existencias, @Param("activo") String activo, @Param("id_categoria") Integer id_categoria);

    @Query(value = "{CALL CRUD.ELIMINAR_PRODUCTO(:id)}", nativeQuery = true)
    void eliminarProducto(@Param("id") Long id);

    @Query(value = "{CALL CRUD.MODIFICAR_PRODUCTO(:id, :nombre, :descripcion, :precio, :existencias, :activo, :id_categoria)}", nativeQuery = true)
    void editarProducto(@Param("id") Long idProducto, @Param("nombre") String nombre, @Param("descripcion") String descripcion, @Param("precio") Double precio, @Param("existencias") Integer existencias, @Param("activo") String activo, @Param("id_categoria") Integer id_categoria);
    
    @Query(value = "SELECT total_productos FROM v_total_productos", nativeQuery = true)
    Integer obtenerTotalProductos();
}