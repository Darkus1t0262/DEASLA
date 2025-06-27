package com.deasla.validation.controller;

import com.deasla.validation.model.ValidationResult;
import com.deasla.validation.service.ValidationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/validations")
@CrossOrigin
public class ValidationController {

    private final ValidationService validationService;

    @Autowired
    public ValidationController(ValidationService validationService) {
        this.validationService = validationService;
    }

    @PostMapping
    public ResponseEntity<ValidationResult> validateAlert(@RequestBody ValidationResult request) {
        return ResponseEntity.status(201).body(validationService.validateAlert(request));
    }

    @GetMapping
    public List<ValidationResult> getAllResults() {
        return validationService.getAllResults();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ValidationResult> getResult(@PathVariable Long id) {
        return validationService.getResult(id)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteResult(@PathVariable Long id) {
        boolean deleted = validationService.deleteResult(id);
        return deleted ? ResponseEntity.noContent().build() : ResponseEntity.notFound().build();
    }
}
