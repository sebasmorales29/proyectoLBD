/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pamonchar.services.impl;

import com.pamonchar.dao.CarruselDao;
import com.pamonchar.domain.Carrusel;
import com.pamonchar.services.CarruselService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CarruselServiceImpl implements CarruselService{
    
    @Autowired
    private CarruselDao carruselDao;
    
    @Override
    @Transactional(readOnly = true)
    public List<Carrusel> getCarrusell(boolean activos) {
        var lista = carruselDao.findAll();
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Carrusel getCarrusell(Carrusel carrusel) {
        return carruselDao.findById(carrusel.getIdCarrusel()).orElse(null);
    }
     @Override
     @Transactional
    public void delete(Carrusel carrusel) {
        carruselDao.delete(carrusel);
    }
    @Override
    @Transactional
    public void save(Carrusel carrusel) {
        carruselDao.save(carrusel);
    }
}
