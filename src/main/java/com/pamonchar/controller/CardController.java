package com.pamonchar.controller;

import com.pamonchar.domain.Card;
import com.pamonchar.services.CardService;
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
@RequestMapping("/card")
public class CardController {

    @Autowired
    private CardService cardServices;

    @GetMapping("/listado")
    public String listado(Model model) {

        var cards = cardServices.getCards(false);
        model.addAttribute("cards", cards);
        model.addAttribute("totalCards", cards.size());
        return "/card/listado";

    }
    @Autowired
    private FirebaseStorageService fireStorageService;

    @PostMapping("/guardar")
    public String guardar(Card card,
            @RequestParam("imagenFile") MultipartFile imagenFile) {

        if (!imagenFile.isEmpty()) {
            cardServices.save(card);
            String rutaImagen = fireStorageService.cargaImagen(imagenFile, "card", card.getIdCard());
            card.setRutaImagen(rutaImagen);
        }

        cardServices.save(card);
        return "redirect:/card/listado";
    }

    @GetMapping("/eliminar/{idCard}")
    public String eliminar(Card card) {

        cardServices.delete(card);
        return "redirect:/card/listado";
    }

    @GetMapping("/modificar/{idCard}")
    public String modificar(Card card, Model model) {
        card = cardServices.getCards(card);
        model.addAttribute("card", card);
        return "/card/modifica";
    }
}
