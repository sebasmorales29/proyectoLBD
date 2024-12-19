package com.pizzeria.pizzeria;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaRepository extends JpaRepository<Categoria, Long> {

    @Query(value = "{CALL CRUD.INSERTAR_CATEGORIA(:descripcion,:activo)}", nativeQuery = true)
    void agregarCategoria(@Param("descripcion") String descripcion,@Param("activo") String activo);

    @Query(value = "{CALL CRUD.MODIFICAR_CATEGORIA(:id, :descripcion, :activo)}", nativeQuery = true)
    void editarCategoria(@Param("id") Long id, @Param("descripcion") String descripcion, @Param("activo") String estado);

    @Query(value = "{CALL CRUD.ELIMINAR_CATEGORIA(:id)}", nativeQuery = true)
    void eliminarCategoria(@Param("id") Long id);
}