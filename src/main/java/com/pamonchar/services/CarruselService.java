/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pamonchar.services;

import com.pamonchar.domain.Carrusel;
import java.util.List;

public interface CarruselService {

    public List<Carrusel> getCarrusell(boolean activos);

    public Carrusel getCarrusell(Carrusel carrusel);

    public void delete(Carrusel carrusel);

    public void save(Carrusel carrusel);
}
