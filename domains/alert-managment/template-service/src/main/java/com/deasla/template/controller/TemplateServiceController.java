package com.deasla.template.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class TemplateServiceController {

    @GetMapping("/api/templates")
    public List<String> getAll() {
        return List.of("TemplateService A", "TemplateService B");
    }
}
