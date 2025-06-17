package com.deasla.validation.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class ValidationServiceController {

    @GetMapping("/api/validations")
    public List<String> getAll() {
        return List.of("ValidationService A", "ValidationService B");
    }
}
