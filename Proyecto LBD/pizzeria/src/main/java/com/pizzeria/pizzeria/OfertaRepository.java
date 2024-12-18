package com.pizzeria.pizzeria;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Modifying;

@Repository
public interface OfertaRepository extends JpaRepository<Oferta, Long> {

    // Llamada para listar ofertas
    

    // Llamada para agregar una oferta
   // @Modifying
    @Query(value = "{CALL CRUD.CREAR_OFERTA(:nombre, :descripcion, :imagen )}", nativeQuery = true)
    void agregarOferta(@Param("nombre") String nombre, @Param("descripcion") String descripcion, @Param("imagen") String imagen);

    // Llamada para editar una oferta existente
    @Query(value = "{CALL CRUD.EDITAR_OFERTA(:id, :nombre, :descripcion, :estado)}", nativeQuery = true)
    void editarOferta(@Param("id") Long id, @Param("nombre") String nombre, @Param("descripcion") String descripcion, @Param("estado") String estado);

    // Llamada para eliminar una oferta
    @Query(value = "{CALL CRUD.ELIMINAR_OFERTA(:id)}", nativeQuery = true)
    void eliminarOferta(@Param("id") Long id);

}