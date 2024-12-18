package com.pizzeria.pizzeria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OfertaController {

    @Autowired
    private OfertaService ofertaService;

    @GetMapping("/ofertas")
    public String mostrarOfertas(Model model) {
        model.addAttribute("ofertas", ofertaService.obtenerTodasLasOfertas());
        return "ofertas"; // Nombre de la plantilla HTML
    }

    
}

