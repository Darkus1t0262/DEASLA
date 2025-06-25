package com.deasla.validation.repository;

import com.deasla.validation.model.ValidationResult;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ValidationResultRepository extends JpaRepository<ValidationResult, Long> {
}
