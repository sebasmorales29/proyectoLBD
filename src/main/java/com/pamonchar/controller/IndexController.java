package com.pamonchar.controller;

import com.pamonchar.services.ProductoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller

public class IndexController {

    @Autowired
    private ProductoService productoServices;
    

    @GetMapping("/")
    public String listado(Model model) {

        var productos = productoServices.getProductos(false);
        model.addAttribute("productos", productos);
       
        return "index";
    }
}
