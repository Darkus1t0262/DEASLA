package com.deasla.alert.model;

import org.springframework.data.cassandra.core.mapping.PrimaryKey;
import org.springframework.data.cassandra.core.mapping.Table;
import org.springframework.data.cassandra.core.mapping.Column;

import java.time.Instant;
import java.util.UUID;

@Table("alerts")
public class Alert {

    @PrimaryKey
    private UUID id;

    @Column("title")
    private String title;

    @Column("message")
    private String message;

    @Column("severity")
    private String severity;

    @Column("area")
    private String area;

    @Column("timestamp")
    private Instant timestamp = Instant.now(); // ✅ Cassandra-friendly timestamp

    // Getters and setters

    public UUID getId() { return id; }
    public void setId(UUID id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public String getSeverity() { return severity; }
    public void setSeverity(String severity) { this.severity = severity; }

    public String getArea() { return area; }
    public void setArea(String area) { this.area = area; }

    public Instant getTimestamp() { return timestamp; }
    public void setTimestamp(Instant timestamp) { this.timestamp = timestamp; }
}
