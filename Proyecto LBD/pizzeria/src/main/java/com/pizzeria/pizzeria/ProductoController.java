package com.pizzeria.pizzeria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/productos")
public class ProductoController {

    @Autowired
    private ProductoService productoService;

    @Autowired
    private CategoriaService categoriaService;

    // Listado
    @GetMapping
    public String listarProductos(Model model) {
        model.addAttribute("productos", productoService.obtenerTodosLosProductos());
    model.addAttribute("categorias", categoriaService.obtenerTodasLasCategorias()); // Cargar categorías
    return "/productos";
    }

    // Agregar
    @PostMapping("/agregar")
    public String agregarProducto(
            @RequestParam String nombre,
            @RequestParam String descripcion,
            @RequestParam Double precio,
            @RequestParam Integer existencias,
            @RequestParam String activo,
            @RequestParam Integer id_categoria,
            RedirectAttributes redirectAttributes) {
        try {
            productoService.agregarProducto(nombre, descripcion, precio, existencias, activo, id_categoria);

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error al agregar la oferta: " + e.getMessage());
            return "redirect:/productos";
        }

        return "redirect:/productos";
    }

    // Editar
    @PostMapping("/editar")
    public String editarProducto(
        @RequestParam Long id,
        @RequestParam String nombre,
        @RequestParam String descripcion,
        @RequestParam Double precio,
        @RequestParam Integer existencias,
        @RequestParam String activo,
        @RequestParam Integer id_categoria) {
        try {
            productoService.editarProducto(id, nombre, descripcion, precio, existencias, activo, id_categoria);
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/productos";
        }
        return "redirect:/productos";
    }

    // Eliminar
    @PostMapping("/eliminar/{id}")
    public String eliminarOferta(@PathVariable Long id) {
        try {
            productoService.eliminarProducto(id);

        } catch (Exception e) {
            return "redirect:/productos";
        }

        return "redirect:/productos";
    }
}