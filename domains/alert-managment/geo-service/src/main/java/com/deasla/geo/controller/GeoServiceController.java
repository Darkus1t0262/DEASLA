package com.deasla.geo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class GeoServiceController {

    @GetMapping("/api/geos")
    public List<String> getAll() {
        return List.of("GeoService A", "GeoService B");
    }
}
