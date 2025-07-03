package com.deasla.alert;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.kafka.annotation.EnableKafka;

@EnableKafka
@SpringBootApplication
public class AlertServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(AlertServiceApplication.class, args);
    }
}
