package com.pizzeria.pizzeria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductoService {

    @Autowired
    private ProductoRepository productoRepository;

    public List<Producto> obtenerTodosLosProductos() {
        return productoRepository.findAll();
    }
    public void agregarProducto(String nombre, String descripcion, Double precio, Integer existencias,String estado,  String categoria) {
        productoRepository.agregarProducto(nombre, descripcion, precio, existencias, estado, categoria);
    }

    public void editarProducto(Long id, String nombre, String descripcion, Double precio, Integer existencias,String estado,  String categoria) {
        productoRepository.editarProducto(id, nombre, descripcion, precio, existencias, estado, categoria);
    }

    public void eliminarProducto(Long id) {
        productoRepository.eliminarProducto(id);
    }
}