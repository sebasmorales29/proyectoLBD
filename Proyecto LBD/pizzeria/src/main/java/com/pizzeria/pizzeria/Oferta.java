package com.pizzeria.pizzeria;

import jakarta.persistence.*;
import org.hibernate.annotations.Immutable;

@Entity
@Immutable 
@Table(name = "V_OFERTAS")
public class Oferta {

    @Id
    @Column(name = "ID_OFERTAS")
    private Long id;

    @Column(name = "NOMBRE")
    private String nombre;

   @Column(name = "DESCRIPCION")
   private String descripcion;

 // @Column(name = "IMAGEN")
 // private String imagen; 

    @Column(name = "ESTADO")
    private String estado;

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
/*
    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

   */ 
    

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}