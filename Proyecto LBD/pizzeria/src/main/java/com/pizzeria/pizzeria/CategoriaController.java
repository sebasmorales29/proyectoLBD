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
@RequestMapping("/categorias")
public class CategoriaController {

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping
    public String listarCategorias(Model model) {
        model.addAttribute("categorias", categoriaService.obtenerTodasLasCategorias());
        model.addAttribute("totalCategorias", categoriaService.obtenerTotalCategorias());
        return "/categorias";
    }

    @PostMapping("/agregar")
    public String agregarCategoria(@RequestParam String descripcion,
                                    @RequestParam String activo,
                                   RedirectAttributes redirectAttributes) {
                                    try  {categoriaService.agregarCategoria(descripcion, activo);
                                    }catch (Exception e)  {
                                        redirectAttributes.addFlashAttribute("error", "Error al agregar la categoria: " + e.getMessage());
                                        return "redirect:/categorias";
                                    } 
        return "redirect:/categorias";
    }

    @PostMapping("/editar")
    public String editarCategoria(@RequestParam Long id, 
                @RequestParam String descripcion,
                 @RequestParam String activo,
                 RedirectAttributes redirectAttributes) {
                try {categoriaService.editarCategoria(id, descripcion, activo);
                }catch (Exception e) {
                    redirectAttributes.addFlashAttribute("error", "Error al editar la categoria: " + e.getMessage());
                    return "redirect:/categorias";
                }
        return "redirect:/categorias";
    }

    @PostMapping("/eliminar/{id}")
    public String eliminarCategoria(@PathVariable Long id) {
        
        try{categoriaService.eliminarCategoria(id);

        }catch (Exception e) {
            return "redirect:/categorias";
        }
        return "redirect:/categorias";
    }
}