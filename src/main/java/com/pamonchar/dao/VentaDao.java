/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pamonchar.dao;

import com.pamonchar.domain.Venta;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Ema
 */
public interface VentaDao extends JpaRepository<Venta,Long>{
    
}
