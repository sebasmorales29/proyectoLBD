package com.pizzeria.pizzeria;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UsuarioService {
        @Autowired
    private UsuarioRepository usuarioRepository;

    public List<Usuario> obtenerUsuarios() {
        return usuarioRepository.findAll();
    }
    public void agregarUsuario(String nombre_usuario, String nombre, String prim_apellido, String seg_apellido, String correo, String contrasena, Integer id_rol, String activo) {
        usuarioRepository.agregarUsuario(nombre_usuario, nombre, prim_apellido, seg_apellido, correo, contrasena, id_rol, activo);
    }
    

    public void editarUsuario(Integer id_usuario, String nombre_usuario, String nombre, String prim_apellido, String seg_apellido, String correo, String contrasena, Integer id_rol, String activo) {
        System.out.println("Editando usuario con ID: " + id_usuario);
        usuarioRepository.editarUsuario(id_usuario, nombre_usuario, nombre, prim_apellido, seg_apellido, correo, contrasena, id_rol, activo);
    }
    

    public void eliminarUsuario(Integer id) {
        usuarioRepository.eliminarUsuario(id);
    }

    
}
