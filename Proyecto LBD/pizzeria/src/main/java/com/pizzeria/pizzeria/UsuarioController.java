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
@RequestMapping("/usuarios")

public class UsuarioController {
    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private RolService rolService;

    @GetMapping
    public String mostrarUsuarios(Model model) {
        
        model.addAttribute("usuarios", usuarioService.obtenerUsuarios());
        model.addAttribute("roles", rolService.obtenerRoles());
        return "/usuarios";
    }

    @PostMapping("/agregar")
public String agregarUsuario(@RequestParam String nombre_usuario,
                             @RequestParam String nombre,
                             @RequestParam String prim_apellido,
                             @RequestParam String seg_apellido,
                             @RequestParam String correo,
                             @RequestParam String contrasena,
                             @RequestParam Integer id_rol,
                             @RequestParam String activo, // Este puede quedar si es usado en la lógica del negocio
                             RedirectAttributes redirectAttributes) {
    try {
        System.out.println("Datos recibidos: " + nombre_usuario + ", " + nombre + ", " + prim_apellido + ",  " + seg_apellido + ",   "+ correo + ",    "+ contrasena + ",    "+ id_rol + ",     "+ activo );
        usuarioService.agregarUsuario(nombre_usuario, nombre, prim_apellido, seg_apellido, correo, contrasena, id_rol,activo);
        redirectAttributes.addFlashAttribute("success", "Usuario agregado exitosamente.");
        System.out.println("Usuario agregado exitosamente.");
    } catch (Exception e) {
        redirectAttributes.addFlashAttribute("error", "Error al agregar el usuario: " + e.getMessage());
        System.out.println("error al agregar usuario." );
        System.err.println("Error al agregar usuario: " + e.getMessage());
        e.printStackTrace();
    }
    return "redirect:/usuarios";
    }
    
    
    @PostMapping("/editar")
    public String editarUsuario(@RequestParam Integer id_usuario,
                                @RequestParam String nombre_usuario,
                                @RequestParam String nombre,
                                @RequestParam String prim_apellido,
                                @RequestParam String seg_apellido,
                                @RequestParam String correo,
                                @RequestParam String contrasena,
                                @RequestParam Integer id_rol,
                                
                                @RequestParam String activo,
                                RedirectAttributes redirectAttributes) {
        try {
            System.out.println("Datos recibidos: "+  id_usuario + ",     " + nombre_usuario + ", " + nombre + ", " + prim_apellido + ",  " + seg_apellido + ",   "+ correo + ",    "+ contrasena + ",    "+ id_rol + ",     "+ activo );
            usuarioService.editarUsuario(id_usuario, nombre_usuario, nombre, prim_apellido, seg_apellido, correo, contrasena, id_rol, activo);
            redirectAttributes.addFlashAttribute("success", "Usuario editado exitosamente.");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Error al editar el usuario: " + e.getMessage());
            e.printStackTrace();
        }
        return "redirect:/usuarios";
    }


    // Eliminar una usuario
    @PostMapping("/eliminar/{id}")
    public String eliminarUsuario(@PathVariable Integer id) {
        try{usuarioService.eliminarUsuario(id);

        }catch (Exception e) {
            return "redirect:/usuarios";
        }
        
        return "redirect:/usuarios";
    }
}
