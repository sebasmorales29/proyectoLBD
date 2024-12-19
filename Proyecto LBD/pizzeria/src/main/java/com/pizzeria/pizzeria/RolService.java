package com.pizzeria.pizzeria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class RolService {

    @Autowired
    private RolRepository RolRepository;

    public List<Rol> obtenerRoles() {
        return RolRepository.findAll();
    }
    public void agregarRol(String nombre) {
        RolRepository.agregarRol(nombre);
    }

    public void editarRol(Long id, String nombre) {
        RolRepository.editarRol(id, nombre);
    }

    public void eliminarRol(Long id) {
        RolRepository.eliminarRol(id);
    }
}