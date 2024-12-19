package com.pizzeria.pizzeria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CategoriaService {

    @Autowired
    private CategoriaRepository categoriaRepository;

    public List<Categoria> obtenerTodasLasCategorias() {
        return categoriaRepository.findAll();
    }

    public Long obtenerTotalCategorias() {
        return categoriaRepository.count();
    }

    public void agregarCategoria(String descripcion, String activo) {
        categoriaRepository.agregarCategoria(descripcion, activo);
    }

    public void editarCategoria(Long id, String descripcion, String estado) {
        categoriaRepository.editarCategoria(id, descripcion, estado);
    }

    public void eliminarCategoria(Long id) {
        categoriaRepository.eliminarCategoria(id);
    }
}