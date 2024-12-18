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
@RequestMapping("/ofertas") // Prefijo base
public class OfertaController {

    @Autowired
    private OfertaService ofertaService;

    // Listar todas las ofertas
    @GetMapping
    public String mostrarOfertas(Model model) {
        model.addAttribute("ofertas", ofertaService.obtenerTodasLasOfertas());
        return "/ofertas"; // Plantilla Thymeleaf
    }

    // Agregar una nueva oferta
    @PostMapping("/agregar")
    public String agregarOferta(@RequestParam String nombre,
                                @RequestParam String descripcion,
                                @RequestParam String imagen,
                                RedirectAttributes redirectAttributes) {
                                    try{ofertaService.agregarOferta(nombre, descripcion,imagen );
                                    
                                    } catch (Exception e) {
                                        redirectAttributes.addFlashAttribute("error", "Error al agregar la oferta: " + e.getMessage());
                                        return "redirect:/ofertas";
                                    }
        
        return "redirect:/ofertas";
    }

    // Editar una oferta existente
    @PostMapping("/editar")
    public String editarOferta(@RequestParam Long id,
                               @RequestParam String nombre,
                               @RequestParam String descripcion,
                               @RequestParam String estado) {
                                try{ofertaService.editarOferta(id, nombre, descripcion, estado);

                                }catch (Exception e) {
                                    return "redirect:/ofertas";
                                }
        
        return "redirect:/ofertas";
    }

    // Eliminar una oferta
    @PostMapping("/eliminar/{id}")
    public String eliminarOferta(@PathVariable Long id) {
        try{ofertaService.eliminarOferta(id);

        }catch (Exception e) {
            return "redirect:/ofertas";
        }
        
        return "redirect:/ofertas";
    }
}
