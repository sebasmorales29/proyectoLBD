package com.pizzeria.pizzeria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/ofertas") // Prefijo base
public class OfertaController {

    @Autowired
    private OfertaService ofertaService;

    // Listar todas las ofertas
    @GetMapping
    public String mostrarOfertas(Model model) {
        model.addAttribute("ofertas", ofertaService.obtenerTodasLasOfertas());
        return "ofertas"; // Plantilla Thymeleaf
    }

    // Agregar una nueva oferta
    @PostMapping("/agregar")
    public String agregarOferta(@RequestParam String nombre,
                                @RequestParam String descripcion,
                                @RequestParam String imagen) {
        ofertaService.agregarOferta(nombre, descripcion,imagen );
        return "redirect:/ofertas";
    }

    // Editar una oferta existente
    @PostMapping("/editar")
    public String editarOferta(@RequestParam Long id,
                               @RequestParam String nombre,
                               @RequestParam String descripcion,
                               @RequestParam String estado) {
        ofertaService.editarOferta(id, nombre, descripcion, estado);
        return "redirect:/ofertas";
    }

    // Eliminar una oferta
    @PostMapping("/eliminar/{id}")
    public String eliminarOferta(@PathVariable Long id) {
        ofertaService.eliminarOferta(id);
        return "redirect:/ofertas";
    }
}
