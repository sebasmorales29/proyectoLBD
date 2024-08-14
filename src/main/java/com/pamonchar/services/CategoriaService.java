/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.pamonchar.services;

import com.pamonchar.domain.Categoria;
import java.util.List;

/**
 *
 * @author Usuario
 */
public interface CategoriaService {
  //Se recupera los registros de la tabla categoria en un 
    //ArrayList depbjetos Categoria. Todos o solo los activos
    public List<Categoria> getCategorias(boolean activos);
    
    public Categoria getCategoria(Categoria categoria);
    
    public void delete(Categoria categoria);
    
    public void save(Categoria categoria);
}
