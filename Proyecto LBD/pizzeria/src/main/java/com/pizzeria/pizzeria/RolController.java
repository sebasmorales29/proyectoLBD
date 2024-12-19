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
@RequestMapping("/roles")
public class RolController {

    @Autowired
    private RolService RolService;

    // Listado
    @GetMapping
    public String listarRoles(Model model) {
        model.addAttribute("roles", RolService.obtenerRoles());
        return "/roles";
    }

    // Agregar
    @PostMapping("/agregar")
    public String agregarRol(
            @RequestParam String nombre,
            RedirectAttributes redirectAttributes) {
        try {
            RolService.agregarRol(nombre);

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/roles";
        }

        return "redirect:/roles";
    }

    // Editar
    @PostMapping("/editar")
    public String editarRol(
            @RequestParam Long id,
            @RequestParam String nombre) {
        try {
            RolService.editarRol(id, nombre);

        } catch (Exception e) {
            return "redirect:/roles";
        }

        return "redirect:/roles";
    }

    // Eliminar
    @PostMapping("/eliminar/{id}")
    public String eliminarOferta(@PathVariable Long id) {
        try {
            RolService.eliminarRol(id);

        } catch (Exception e) {
            return "redirect:/roles";
        }

        return "redirect:/roles";
    }
}