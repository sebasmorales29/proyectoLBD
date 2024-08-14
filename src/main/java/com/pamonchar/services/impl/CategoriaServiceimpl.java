/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pamonchar.services.impl;

import com.pamonchar.dao.CategoriaDao;
import com.pamonchar.domain.Categoria;
import com.pamonchar.services.CategoriaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Usuario
 */
@Service
public class CategoriaServiceimpl implements CategoriaService {

    @Autowired
    private CategoriaDao categoriaDao;

    @Override
    public List<Categoria> getCategorias(boolean activos) {
        var lista = categoriaDao.findAll();

        if (activos) {//si solo quiero activos}
            lista.removeIf(c -> !c.isActivo());
        }

        return lista;
    }
    @Override
    public Categoria getCategoria(Categoria categoria) {

        return categoriaDao.findById(categoria.getIdCategoria()).orElse(null);
    }
    @Override
    public void delete(Categoria categoria) {
        categoriaDao.delete(categoria);
    }
    @Override

    public void save(Categoria categoria) {
        categoriaDao.save(categoria);
    }
}
