/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pamonchar.services.impl;

import com.pamonchar.dao.CardDao;
import com.pamonchar.domain.Card;
import com.pamonchar.services.CardService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CardServiceImpl implements CardService{
    
    @Autowired
    private CardDao cardDao;
    
    @Override
    @Transactional(readOnly = true)
    public List<Card> getCards(boolean activos) {
        var lista = cardDao.findAll();
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Card getCards(Card card) {
        return cardDao.findById(card.getIdCard()).orElse(null);
    }
     @Override
     @Transactional
    public void delete(Card card) {
        cardDao.delete(card);
    }
    @Override
    @Transactional
    public void save(Card card) {
        cardDao.save(card);
    }
}
