/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pamonchar.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name="carrusel")
public class Carrusel implements Serializable{
    private static final long serialVersionUID= 1l;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id_carrusel")
    
    private Long idCarrusel; 
    
    private String nombre;
    private String descripcion;
    private String rutaImagen;
    private boolean activo;
}
