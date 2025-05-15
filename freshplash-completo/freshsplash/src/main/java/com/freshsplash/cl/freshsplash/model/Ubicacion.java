package com.freshsplash.cl.freshsplash.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Column;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;



@Entity
@Table(name="ubicacion")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ubicacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 20,nullable=false)
    private String pais;

    @Column(length = 20,nullable=false)
    private String region;

    @Column(length = 20,nullable=false)
    private String ciudad;

    @Column(length = 20,nullable=false)
    private String comuna;
    
    @Column(length = 20,nullable=false)
    private String direccion;


}
