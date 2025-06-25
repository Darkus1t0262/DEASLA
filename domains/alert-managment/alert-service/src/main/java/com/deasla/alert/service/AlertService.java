package com.deasla.alert.service;

import com.deasla.alert.model.Alert;
import com.deasla.alert.repository.AlertRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

// Repository and Singleton patterns (Spring's @Service is Singleton by default)
@Service
public class AlertService {

    private final AlertRepository alertRepository;

    @Autowired
    public AlertService(AlertRepository alertRepository) {
        this.alertRepository = alertRepository;
    }

    public Alert createAlert(Alert alert) {
        return alertRepository.save(alert);
    }

    public List<Alert> getAllAlerts() {
        return alertRepository.findAll();
    }

    public Optional<Alert> getAlert(Long id) {
        return alertRepository.findById(id);
    }

    public Alert updateAlert(Long id, Alert alertDetails) {
        return alertRepository.findById(id).map(alert -> {
            alert.setTitle(alertDetails.getTitle());
            alert.setMessage(alertDetails.getMessage());
            alert.setSeverity(alertDetails.getSeverity());
            alert.setArea(alertDetails.getArea());
            alert.setTimestamp(alertDetails.getTimestamp());
            return alertRepository.save(alert);
        }).orElse(null);
    }

    public boolean deleteAlert(Long id) {
        if (!alertRepository.existsById(id)) return false;
        alertRepository.deleteById(id);
        return true;
    }
}
