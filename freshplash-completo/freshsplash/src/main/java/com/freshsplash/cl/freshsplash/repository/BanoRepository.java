package com.freshsplash.cl.freshsplash.repository;

import java.time.LocalTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.freshsplash.cl.freshsplash.model.Bano;

@Repository
public interface BanoRepository extends JpaRepository<Bano, Long> {

    List<Bano> findByetiquetas(String etiquetas);

    List<Bano> findByHorarioApertuda(List<LocalTime> horarioApertura);

    Bano findbyId(Integer id);

}
