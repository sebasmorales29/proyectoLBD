package com.pizzeria.pizzeria;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
    @Query(value = "{CALL CRUD.CREAR_USUARIO(:nombre_usuario, :nombre, :prim_apellido, :seg_apellido, :correo,:contrasena, :id_rol,:activo)}", nativeQuery = true)
    void agregarUsuario(@Param("nombre_usuario") String nombre_usuario, 
            @Param("nombre") String nombre,
            @Param("prim_apellido") String prim_apellido,
            @Param("seg_apellido") String seg_apellido,
            @Param("correo") String correo, 
            @Param("contrasena") String contrasena, 
            @Param("id_rol") Integer id_rol,
            @Param("activo") String activo);
            
            

    @Query(value = "{CALL CRUD.ELIMINAR_USUARIO(:id)}", nativeQuery = true)
    void eliminarUsuario(@Param("id") Integer id);

    @Query(value = "{CALL CRUD.ACTUALIZAR_USUARIO(:id_usuario,:nombre_usuario, :nombre, :prim_apellido, :seg_apellido, :correo,:contrasena, :id_rol,  :estado)}", nativeQuery = true)
void editarUsuario(@Param("id_usuario") Integer id_usuario,
                   @Param("nombre_usuario") String nombre_usuario,
                   @Param("nombre") String nombre,
                   @Param("prim_apellido") String prim_apellido,
                   @Param("seg_apellido") String seg_apellido,
                   @Param("correo") String correo,
                   @Param("contrasena") String contrasena,
                   @Param("id_rol") Integer id_rol,
                   @Param("estado") String activo);

}
