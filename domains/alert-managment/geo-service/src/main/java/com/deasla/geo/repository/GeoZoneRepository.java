package com.deasla.geo.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Repository;

import com.deasla.geo.model.GeoZone;

@Repository
public class GeoZoneRepository {
    private final Map<String, GeoZone> zones = new HashMap<>();

    public GeoZone save(GeoZone zone) {
        zones.put(zone.getId(), zone);
        return zone;
    }

    public List<GeoZone> findAll() {
        return new ArrayList<>(zones.values());
    }

    public Optional<GeoZone> findById(String id) {
        return Optional.ofNullable(zones.get(id));
    }
}
