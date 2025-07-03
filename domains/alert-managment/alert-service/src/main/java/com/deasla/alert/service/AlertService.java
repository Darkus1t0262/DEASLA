package com.deasla.alert.service;

import com.deasla.alert.model.Alert;
import com.deasla.alert.repository.AlertRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AlertService {

    private final AlertRepository alertRepository;
    private final KafkaTemplate<String, String> kafkaTemplate;

    private static final String TOPIC = "alert-events";

    @Autowired
    public AlertService(AlertRepository alertRepository, KafkaTemplate<String, String> kafkaTemplate) {
        this.alertRepository = alertRepository;
        this.kafkaTemplate = kafkaTemplate;
    }

    public Alert createAlert(Alert alert) {
        Alert savedAlert = alertRepository.save(alert);

        // 🔁 Send alert to Kafka
        String message = String.format("ALERT[%d]: %s - %s", savedAlert.getId(), savedAlert.getSeverity(), savedAlert.getMessage());
        kafkaTemplate.send(TOPIC, message);

        return savedAlert;
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
