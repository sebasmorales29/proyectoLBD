/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pamonchar.services;

import com.pamonchar.domain.Card;
import java.util.List;

public interface CardService {

    public List<Card> getCards(boolean activos);

    public Card getCards(Card carrusel);

    public void delete(Card carrusel);

    public void save(Card carrusel);
}
