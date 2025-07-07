package com.deasla.geo.service;

import com.deasla.geo.model.GeoZone;
import com.deasla.geo.repository.GeoZoneRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GeoService {

    @Autowired
    private GeoZoneRepository repository;

    public List<GeoZone> getAllZones() {
        return repository.findAll();
    }

    public GeoZone addZone(GeoZone zone) {
        if (zone.getId() == null) {
            zone.setId(UUID.randomUUID().toString());
        }
        return repository.save(zone);
    }

    // Ray-casting algorithm for point-in-polygon
    public boolean isPointInZone(String zoneId, double lat, double lon) {
        return repository.findById(zoneId).map(zone -> {
            List<List<Double>> polygon = zone.getPolygon();
            int n = polygon.size();
            boolean inside = false;
            for (int i = 0, j = n - 1; i < n; j = i++) {
                double xi = polygon.get(i).get(0), yi = polygon.get(i).get(1);
                double xj = polygon.get(j).get(0), yj = polygon.get(j).get(1);
                if (((yi > lon) != (yj > lon)) &&
                        (lat < (xj - xi) * (lon - yi) / (yj - yi + 1e-10) + xi)) {
                    inside = !inside;
                }
            }
            return inside;
        }).orElse(false);
    }
}
