/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pamonchar.dao;

import com.pamonchar.domain.Factura;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Ema
 */
public interface FacturaDao extends JpaRepository <Factura,Long> {
     
}
