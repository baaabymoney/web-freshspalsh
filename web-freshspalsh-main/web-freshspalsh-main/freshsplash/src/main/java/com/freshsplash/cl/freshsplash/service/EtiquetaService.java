package com.freshsplash.cl.freshsplash.service;

import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.freshsplash.cl.freshsplash.model.Etiqueta;
import com.freshsplash.cl.freshsplash.repository.EtiquetaRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EtiquetaService {

    @Autowired
    private EtiquetaRepository etiquetaRepository;

    private static final int cargo = 500; 

    public List<Etiqueta> obtenerEtiquetas() {
        return etiquetaRepository.findAll();
    }

    public Etiqueta obtenerEtiquetaPorId(Long id) {
        return etiquetaRepository.findById(id).orElse(null);
    }

    public Etiqueta guardarEtiqueta(Etiqueta etiqueta) {
        if (!etiqueta.isGratuito() && (etiqueta.getPrecio() == null || etiqueta.getPrecio() <= 0)) {
            etiqueta.setPrecio(cargo);
        }
        return etiquetaRepository.save(etiqueta);
    }

    public void eliminarEtiqueta(Long id) {
        etiquetaRepository.deleteById(id);
    }

    public Etiqueta actualizarEtiqueta(Long id, Etiqueta etiqueta) {
        Etiqueta etiquetaExistente = etiquetaRepository.findById(id).orElse(null);
        if (etiquetaExistente != null) {
            etiquetaExistente.setAccesoDiscapacitado(etiqueta.isAccesoDiscapacitado());
            etiquetaExistente.setGratuito(etiqueta.isGratuito());

            if (!etiqueta.isGratuito() && (etiqueta.getPrecio() == null || etiqueta.getPrecio() <= 0)) {
                etiquetaExistente.setPrecio(cargo);
            } else {
                etiquetaExistente.setPrecio(etiqueta.getPrecio());
            }

            return etiquetaRepository.save(etiquetaExistente);
        } else {
            return null;
        }
    }

    public boolean esAccesibleParaDiscapacitados(Long id) {
        Etiqueta etiqueta = etiquetaRepository.findById(id).orElse(null);
        return etiqueta != null && etiqueta.isAccesoDiscapacitado();
    }

    public boolean esGratuito(Long id) {
        Etiqueta etiqueta = etiquetaRepository.findById(id).orElse(null);
        return etiqueta != null && etiqueta.isGratuito();
    }

    public Etiqueta actualizarPrecio(Long id, Integer nuevoPrecio) {
    Etiqueta etiquetaExistente = etiquetaRepository.findById(id).orElse(null);
    if (etiquetaExistente != null) {
        if (nuevoPrecio != null && nuevoPrecio > 0) {
            etiquetaExistente.setPrecio(nuevoPrecio);
        } else {
            etiquetaExistente.setPrecio(cargo);
        }
        return etiquetaRepository.save(etiquetaExistente);
    } else {
        return null;
    }
}
}