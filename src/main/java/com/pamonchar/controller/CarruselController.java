package com.pamonchar.controller;

import com.pamonchar.domain.Carrusel;
import com.pamonchar.services.CarruselService;
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
@RequestMapping("/carrusel")
public class CarruselController {

    @Autowired
    private CarruselService carruselServices;

    @GetMapping("/listado")
    public String listado(Model model) {

        var carrusell = carruselServices.getCarrusell(false);
        model.addAttribute("carrusell", carrusell);
        model.addAttribute("totalCarrusell", carrusell.size());
        return "/carrusel/listado";

    }
    @Autowired
    private FirebaseStorageService fireStorageService;

    @PostMapping("/guardar")
    public String guardar(Carrusel carrusel,
            @RequestParam("imagenFile") MultipartFile imagenFile) {

        if (!imagenFile.isEmpty()) {
            carruselServices.save(carrusel);
            String rutaImagen = fireStorageService.cargaImagen(imagenFile, "carrusel", carrusel.getIdCarrusel());
            carrusel.setRutaImagen(rutaImagen);
        }

        carruselServices.save(carrusel);
        return "redirect:/carrusel/listado";
    }

    @GetMapping("/eliminar/{idCarrusel}")
    public String eliminar(Carrusel carrusel) {

        carruselServices.delete(carrusel);
        return "redirect:/carrusel/listado";
    }

    @GetMapping("/modificar/{idCarrusel}")
    public String modificar(Carrusel carrusel, Model model) {
        carrusel = carruselServices.getCarrusell(carrusel);
        model.addAttribute("carrusel", carrusel);
        return "/carrusel/modifica";
    }
}
