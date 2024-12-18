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

    
}