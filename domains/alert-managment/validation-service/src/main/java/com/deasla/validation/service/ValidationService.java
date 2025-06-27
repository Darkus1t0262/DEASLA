package com.deasla.validation.service;

import com.deasla.validation.model.ValidationResult;
import com.deasla.validation.repository.ValidationResultRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

// Repository and Singleton patterns (Spring's @Service is Singleton by default)
@Service
public class ValidationService {

    private final ValidationResultRepository validationResultRepository;

    @Autowired
    public ValidationService(ValidationResultRepository validationResultRepository) {
        this.validationResultRepository = validationResultRepository;
    }

    // Factory-like pattern could be applied if validations are complex.

    public ValidationResult validateAlert(ValidationResult validationResult) {
        // Example logic: always PASS if alertTitle not empty; else FAIL
        if (validationResult.getAlertTitle() != null && !validationResult.getAlertTitle().isEmpty()) {
            validationResult.setStatus("PASSED");
            validationResult.setDetails("All validations passed.");
        } else {
            validationResult.setStatus("FAILED");
            validationResult.setDetails("Missing alert title.");
        }
        return validationResultRepository.save(validationResult);
    }

    public List<ValidationResult> getAllResults() {
        return validationResultRepository.findAll();
    }

    public Optional<ValidationResult> getResult(Long id) {
        return validationResultRepository.findById(id);
    }

    public boolean deleteResult(Long id) {
        if (!validationResultRepository.existsById(id)) return false;
        validationResultRepository.deleteById(id);
        return true;
    }
}
