package com.pizzeria.pizzeria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class RolService {
    @Autowired
    private RolRepository rolRepository;

    public List<Rol> obtenerRoles() {
        return rolRepository.findAll(); // Devuelve todos los roles de la tabla
    }



    public void agregarRol(String nombre) {
        rolRepository.agregarRol(nombre);
    }


    public void editarRol(Long id, String nombre) {
        rolRepository.editarRol(id, nombre);
    }


}
