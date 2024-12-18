package com.pizzeria.pizzeria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class OfertaService {

    @Autowired
    private OfertaRepository ofertaRepository;

    public List<Oferta> obtenerTodasLasOfertas() {
        return ofertaRepository.findAll();
    }

    public void agregarOferta(String nombre, String descripcion, String imagen) {
        ofertaRepository.agregarOferta(nombre, descripcion,imagen);
    }

    public void editarOferta(Long id, String nombre, String descripcion, String estado) {
        ofertaRepository.editarOferta(id, nombre, descripcion, estado);
    }

    public void eliminarOferta(Long id) {
        ofertaRepository.eliminarOferta(id);
    }
    
}