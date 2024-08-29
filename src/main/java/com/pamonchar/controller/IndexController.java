package com.pamonchar.controller;

import com.pamonchar.services.CardService;
import com.pamonchar.services.CarruselService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller

public class IndexController {

    @Autowired
    private CarruselService carruselServices;
    @Autowired
      private CardService cardServices;

    
    @GetMapping("/")
    public String listado(Model model) {
        var carrusell = carruselServices.getCarrusell(false);
        model.addAttribute("carrusell", carrusell);
        var cards = cardServices.getCards(false);
        model.addAttribute("cards", cards);
        return "index";
    }
}
