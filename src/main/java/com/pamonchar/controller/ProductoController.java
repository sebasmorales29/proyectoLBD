package com.pamonchar.controller;

import com.pamonchar.controller.*;
import com.pamonchar.domain.Producto;
import com.pamonchar.services.CategoriaService;
import com.pamonchar.services.ProductoService;
import com.pamonchar.services.FirebaseStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/producto")
public class ProductoController {

    @Autowired
    private ProductoService productoServices;
    @Autowired
    private CategoriaService categoriaServices;

    @GetMapping("/listado")
    public String listado(Model model) {

        var productos = productoServices.getProductos(false);
        model.addAttribute("productos", productos);
        model.addAttribute("totalProductos", productos.size());
        var categorias = categoriaServices.getCategorias(false);
        model.addAttribute("categorias", categorias);
        return "/producto/listado";

    }
    @Autowired
    private FirebaseStorageService fireStorageService;

    @PostMapping("/guardar")
    public String guardar(Producto producto,
            @RequestParam("imagenFile") MultipartFile imagenFile) {

        if (!imagenFile.isEmpty()) {
            productoServices.save(producto);
            String rutaImagen = fireStorageService.cargaImagen(imagenFile, "producto", producto.getIdProducto());
            producto.setRutaImagen(rutaImagen);
        }

        productoServices.save(producto);
        return "redirect:/producto/listado";
    }

    @GetMapping("/eliminar/{idProducto}")
    public String eliminar(Producto producto) {

        productoServices.delete(producto);
        return "redirect:/producto/listado";
    }

    @GetMapping("/modificar/{idProducto}")
    public String modificar(Producto producto, Model model) {
        producto = productoServices.getProducto(producto);
        model.addAttribute("producto", producto);
        var categorias = categoriaServices.getCategorias(false);
        model.addAttribute("categorias", categorias);
        return "/producto/modifica";
    }
}
