package com.freshsplash.cl.freshsplash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.freshsplash.cl.freshsplash.model.Etiqueta;


import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/etiquetas")
public class EtiquetaController {

    @Autowired
    private EtiquetaService EtiquetaService;

    @GetMapping
    public ResponseEntity<List<Atencion>> listar() {
        List<Atencion> atenciones = atencionService.obtenerAtenciones();
        if (atenciones.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(atenciones);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Atencion> buscarAtencionPorId(Long id) {
        Atencion atencion = atencionService.obtenerAtencionPorId(id);
        if (atencion == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(atencion);
    }

    @GetMapping("/resumen")
    public ResponseEntity<List<Map<String, Object>>> resumen() {
        List<Map<String, Object>> resumen = atencionService.obtenerAtencionesConNombres();
        if (resumen.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(resumen);
    }

    @PostMapping
    public ResponseEntity<Atencion> guardar(@RequestBody Atencion atencion) {
        Atencion nuevaAtencion = atencionService.guardarAtencion(atencion);
        return ResponseEntity.status(201).body(nuevaAtencion);
    }


    @PutMapping("/{id}")
    public ResponseEntity<Atencion> actualizar(Long id,@RequestBody Atencion atencion) {
        Atencion atencionActualizada = atencionService.actualizarAtencion(id, atencion);
        if (atencionActualizada == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(atencionActualizada);
    }

    @PatchMapping("/{id}")
    public ResponseEntity<Atencion> editar(Long id,@RequestBody Atencion atencion) {
        Atencion atencionActualizada = atencionService.actualizarAtencion(id, atencion);
        if (atencionActualizada == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(atencionActualizada);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> eliminar(Long id) {
        atencionService.eliminarAtencion(id);
        return ResponseEntity.noContent().build();
    }
}
