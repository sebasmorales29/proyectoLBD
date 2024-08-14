/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pamonchar.services.impl;

import com.pamonchar.dao.UsuarioDao;
import com.pamonchar.domain.Rol;
import com.pamonchar.domain.Usuario;
import com.pamonchar.services.UsuarioDetailsService;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Usuario
 */
@Service("userDetailService")
public class UsuarioDetailsServiceImpl
        implements UsuarioDetailsService, UserDetailsService {

    @Autowired
    private UsuarioDao usuarioDao;
    @Autowired
    private HttpSession session;

    @Override
    @Transactional(readOnly = true)

    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {

        //se busca el usuario por el username en la tabla usuario
        Usuario usuario = usuarioDao.findByUsername(username);
        
        //se valida si lo encontro
        
        if(usuario==null){
            //No encontro el registro con el username pasado
            throw new UsernameNotFoundException(username);
        }
        //si estamos aca.. si se encontró el usuario con el usernamepasado
        //se carga la imagen del usuario
        session.removeAttribute("ImagneUsuario");
        session.setAttribute("imagenUsuario", usuario.getRutaImagen());
        
        //se deben cargar los roles del usuario.. como roles de seguridad
        
        var roles= new ArrayList<GrantedAuthority>();
        for (Rol r : usuario.getRoles()){
            roles.add(new SimpleGrantedAuthority(r.getNombre()));
        }
        
        //se retorna un usario ya tipo UserDetails
        return new User(usuario.getUsername(),usuario.getPassword(),roles);

    }

}
