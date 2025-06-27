package com.deasla.geo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.deasla.geo.model.GeoZone;
import com.deasla.geo.service.GeoService;

@RestController
@RequestMapping("/api/geo")
public class GeoController {

    @Autowired
    private GeoService geoService;

    @GetMapping("/zones")
    public List<GeoZone> getAllZones() {
        return geoService.getAllZones();
    }

    @PostMapping("/zones")
    public GeoZone addZone(@RequestBody GeoZone zone) {
        return geoService.addZone(zone);
    }

    @PostMapping("/zones/{zoneId}/contains")
    public Map<String, Boolean> isPointInZone(
            @PathVariable String zoneId,
            @RequestBody Map<String, Double> point) {
        double lat = point.get("lat");
        double lon = point.get("lon");
        boolean inside = geoService.isPointInZone(zoneId, lat, lon);
        return Map.of("inside", inside);
    }
}
