package com.pizzeria.pizzeria;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/roles")
public class RolController {

    @Autowired
    private RolService rolService;

    @GetMapping
    public String listarRoles(Model model) {
        model.addAttribute("roles", rolService.obtenerTodosLosRoles());
        return "roles";
    }

    @PostMapping("/agregar")
    public String agregarRol(
            @RequestParam String nombre,
            RedirectAttributes redirectAttributes) {
        try {
            rolService.agregarRol(nombre);
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error al agregar el rol: " + e.getMessage());
        }
        return "redirect:/roles";
    }

    @PostMapping("/editar")
    public String editarRol(
            @RequestParam Long id,
            @RequestParam String nombre) {
        try {
            rolService.editarRol(id, nombre);
        } catch (Exception e) {
            return "redirect:/roles";
        }
        return "redirect:/roles";
    }

    @PostMapping("/eliminar")
    public String eliminarRol(@RequestParam Long id) {
        try {
            rolService.eliminarRol(id);
        } catch (Exception e) {
            return "redirect:/roles";
        }
        return "redirect:/roles";
    }
}
