/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pamonchar.dao;

import com.pamonchar.domain.Producto;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 *
 * @author Usuario
 */
public interface ProductoDao 
        extends JpaRepository<Producto,Long>{
    
    //Se define una consulta amplidada considerando los atributos
    public List<Producto> findByPrecioBetweenOrderByDescripcion(
            double precioInf,double precioSup);
    
    //Se define una consulta JPQL
    @Query(value= "SELECT a FROM Producto a "
            +"WHERE a.precio BETWEEN :precioInf AND :precioSup "
            +"ORDER BY a.descripcion ASC")
    public List<Producto> consulta2(double precioInf,double precioSup);
    
    //Se define una consulta SQL
    @Query(nativeQuery = true,
            value= "SELECT * FROM producto a "
            +"WHERE a.precio BETWEEN :precioInf AND :precioSup "
            +"ORDER BY a.descripcion ASC")
    public List<Producto> consulta3(double precioInf,double precioSup);
    //Consulta Ampliada tarea 4
    public List<Producto> findByActivoTrueOrderByDescripcion();
}
