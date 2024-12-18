package com.pizzeria.pizzeria;

import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;


@Entity
@Immutable 

@Table(name = "V_PRODUCTO")

public class Producto {

    @Id
    @Column(name = "ID_PRODUCTO", nullable = false) //Llave primaria
    private Long idProducto;

    @Column(name = "NOMBRE")
    private String nombre;

   @Column(name = "PRECIO")
   private Double precio;

    @Column(name = "DESCRIPCION")
    private String descripcion;

  @Column(name = "EXISTENCIAS")
   private Integer existencias; 

    @Column(name = "CATEGORIA")
    private String categoria; 
   @Column(name = "ESTADO")
   private String estado;

    // Getters y Setters
    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }


    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

        

    public Integer getExistencias() { 
        return existencias;
    }

    public void setExistencias(Integer existencias) { 
        this.existencias = existencias;
    }

    public String getCategoria() { 
        return categoria;
    }

    public void setCategoria(String categoria) { 
        this.categoria = categoria;
    }
    

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

   
}
