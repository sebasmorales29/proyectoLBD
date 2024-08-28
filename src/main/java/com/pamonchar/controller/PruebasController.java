package com.pamonchar.controller;

import com.pamonchar.controller.*;
import com.pamonchar.domain.Categoria;
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
import com.pamonchar.services.CategoriaService;

@Controller
@RequestMapping("/pruebas")
public class PruebasController {

    @Autowired
    private ProductoService productoServices;
    @Autowired
    private CategoriaService categoriaServices;
    
//    ORDENAR YA
    @GetMapping("/listado")
    public String listado(Model model) {
        var productos = productoServices.getProductos(false);
        model.addAttribute("productos", productos);
        var categorias = categoriaServices.getCategorias(false);
        model.addAttribute("categorias", categorias);
        return "/pruebas/listado";

    }

    @GetMapping("/listado/{idCategoria}")
    public String listado(Categoria producto, Model model) {
        var productos = categoriaServices.getCategoria(producto).getProductos();
        model.addAttribute("productos", productos);
        var categorias = categoriaServices.getCategorias(false);
        model.addAttribute("categorias", categorias);
        return "/pruebas/listado";
    }
    
        @GetMapping("/consulta1")
    public String consulta1(
            @RequestParam(value = "precioInf") double precioInf,
            @RequestParam(value = "precioSup") double precioSup,
            Model model) {
        var productos = productoServices.consulta1(precioInf, precioSup);
        model.addAttribute("productos", productos);
        model.addAttribute("precioInf", precioInf);
        model.addAttribute("precioSup", precioSup);
        return "/pruebas/listado";

    }
    
   //    MENU
    @GetMapping("/listado2")
    public String listado2(Model model) {
        var productos = productoServices.getProductos(false);
        model.addAttribute("productos", productos);
        var categorias = categoriaServices.getCategorias(false);
        model.addAttribute("categorias", categorias);
        return "/pruebas/listado2";

    }

    @GetMapping("/listado2/{idCategoria}")
    public String listado2(Categoria producto, Model model) {
        var productos = categoriaServices.getCategoria(producto).getProductos();
        model.addAttribute("productos", productos);
        var categorias = categoriaServices.getCategorias(false);
        model.addAttribute("categorias", categorias);
        return "/pruebas/listado2";
    }
    
        @GetMapping("/consulta2")
    public String consulta2(
            @RequestParam(value = "precioInf") double precioInf,
            @RequestParam(value = "precioSup") double precioSup,
            Model model) {
        var productos = productoServices.consulta2(precioInf, precioSup);
        model.addAttribute("productos", productos);
        model.addAttribute("precioInf", precioInf);
        model.addAttribute("precioSup", precioSup);
        return "/pruebas/listado2";

    }
 
    

//    @GetMapping("/listado2")
//    public String listado2(Model model) {
//        var productos = productoServices.getProductos(false);
//        model.addAttribute("productos", productos);
//        return "/pruebas/listado2";
//
//    }

//    @GetMapping("/consulta2")
//    public String consulta2(
//            @RequestParam(value = "precioInf") double precioInf,
//            @RequestParam(value = "precioSup") double precioSup,
//            Model model) {
//        var productos = productoServices.consulta1(precioInf, precioSup);
//        model.addAttribute("productos", productos);
//        model.addAttribute("precioInf", precioInf);
//        model.addAttribute("precioSup", precioSup);
//        return "/pruebas/listado2";
//    }
//
//    @GetMapping("/consulta3")
//    public String consulta3(
//            @RequestParam(value = "precioInf") double precioInf,
//            @RequestParam(value = "precioSup") double precioSup,
//            Model model) {
//        var productos = productoServices.consulta1(precioInf, precioSup);
//        model.addAttribute("productos", productos);
//        model.addAttribute("precioInf", precioInf);
//        model.addAttribute("precioSup", precioSup);
//        return "/pruebas/listado2";
//    }
//        @GetMapping("/consulta4")
//    public String consulta4(Model model) {
//        var productoActivos = productoServices.getProductos(true);
//        model.addAttribute("productos", productoActivos);
//        return "/pruebas/listado2";
//}
}
