package com.deasla.alert.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
public class AlertServiceController {

    @GetMapping("/api/alerts")
    public List<String> getAll() {
        return List.of("AlertService A", "AlertService B");
    }
}
