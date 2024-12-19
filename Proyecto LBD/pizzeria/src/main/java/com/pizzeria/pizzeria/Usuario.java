package com.pizzeria.pizzeria;


import jakarta.persistence.*;



@Entity
@Table(name = "V_USUARIO")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_USUARIO")
    private Integer id_usuario;

    @Column(name = "NOMBRE_USUARIO")
    private String nombre_usuario;

    @Column(name = "NOMBRE")
    private String nombre;




    @Column(name = "PRIM_APELLIDO")
    private String prim_apellido; 

    @Column(name = "SEG_APELLIDO")
    private String seg_apellido; 

    @Column(name = "CORREO")
    private String correo;

    @Column(name = "ID_ROL")
    private Integer id_rol;

    @Column(name = "ROL")
    private String rol;



    @Column(name = "ACTIVO")
    private String activo;



    @Column(name = "CONTRASENA")
    private String contrasena;


        // Getters y Setters

    public String getPrim_apellido() {
        return prim_apellido;
    }

    public void setPrim_apellido(String prim_apellido) {
        this.prim_apellido = prim_apellido;
    }

    public String getSeg_apellido() {
        return seg_apellido;
    }

    public void setSeg_apellido(String seg_apellido) {
        this.seg_apellido = seg_apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Integer getId_rol() {
        return id_rol;
    }

    public void setId_rol(Integer id_rol) {
        this.id_rol = id_rol;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public Integer getId_usuario() {
        return id_usuario;
    }

    public void setId_Usuario(Integer id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public void setEmail(String correo) {
        this.correo = correo;
    }

    public String getActivo() {
        return activo;
    }

    public void setActivo(String activo) {
        this.activo = activo;
    }



        
    public String getNombre_usuario() {
        return nombre_usuario;
    }

    public void setNombre_usuario(String nombre_usuario) {
        this.nombre_usuario = nombre_usuario;
    }


    
    public String getContrasena() {
        return contrasena;
    }
    
    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    

}