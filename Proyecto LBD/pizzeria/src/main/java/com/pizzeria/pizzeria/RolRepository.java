package com.pizzeria.pizzeria;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RolRepository extends JpaRepository<Rol, Long> {

    @Query(value = "{CALL CRUD.INSERTAR_ROL(:nombre)}", nativeQuery = true)
    void agregarRol(@Param("nombre") String nombre);

    @Query(value = "{CALL CRUD.ELIMINAR_Rol(:id)}", nativeQuery = true)
    void eliminarRol(@Param("id") Long id);

    @Query(value = "{CALL CRUD.MODIFICAR_ROL(:id, :nombre)}", nativeQuery = true)
    void editarRol(@Param("id") Long idProducto, @Param("nombre") String nombre);
}