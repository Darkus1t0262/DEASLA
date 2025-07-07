package com.deasla.geo.model;

import java.util.List;

public class GeoZone {
    private String id;
    private String name;
    private List<List<Double>> polygon; // List of [lat, lon] pairs
    // For circles, you could add: private Double radius;

    public GeoZone() {}

    public GeoZone(String id, String name, List<List<Double>> polygon) {
        this.id = id;
        this.name = name;
        this.polygon = polygon;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public List<List<Double>> getPolygon() { return polygon; }
    public void setPolygon(List<List<Double>> polygon) { this.polygon = polygon; }
}
