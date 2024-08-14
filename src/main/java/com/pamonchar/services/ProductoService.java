/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pamonchar.services;

import com.pamonchar.domain.Producto;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface ProductoService {
  //Se recupera los registros de la tabla producto en un 
    //ArrayList depbjetos Producto. Todos o solo los activos
    public List<Producto> getProductos(boolean activos);
    
    public Producto getProducto(Producto producto);
    
    public void delete(Producto producto);
    
    public void save(Producto producto);
    
    //ASe utiliza la consulta1... consulta ampliada
    public List<Producto> consulta1(double precioInf,double precioSup);
    
    //ASe utiliza la consulta2... consulta JPQL
    public List<Producto> consulta2(double precioInf,double precioSup);
    
    //ASe utiliza la consulta3... consulta SQL
    public List<Producto> consulta3(double precioInf,double precioSup);
}
