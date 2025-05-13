package com.freshsplash.cl.freshsplash.model;

import com.freshsplash.cl.freshsplash.model.Etiqueta;
import com.freshsplash.cl.freshsplash.model.Horario;
import com.freshsplash.cl.freshsplash.model.Ubicacion;
import com.freshsplash.cl.freshsplash.model.Calificacion;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Entity
@Table(name= "etiqueta")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bano {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name="etiqueta_id", nullable=false)
    private Etiqueta etiqueta;
    @ManyToOne
    @JoinColumn(name="horario_id", nullable=false)
    private Horario horario;
    @ManyToOne
    @JoinColumn(name="ubicacion_id", nullable=false)
    private Ubicacion ubicacion;
    @ManyToOne
    @JoinColumn(name="calificacion_id", nullable=false)
    private Calificacion calificacion;

}
