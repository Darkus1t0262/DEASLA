package com.deasla.validation;

import com.deasla.validation.model.ValidationResult;
import com.deasla.validation.repository.ValidationResultRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class ValidationServiceApplicationTests {

    @Autowired
    private ValidationResultRepository validationResultRepository;

    @Test
    void testValidateAndFindResult() {
        ValidationResult result = new ValidationResult();
        result.setAlertTitle("Tornado Alert");
        result.setStatus("PASSED");
        result.setDetails("All fields valid.");

        validationResultRepository.save(result);

        var found = validationResultRepository.findById(result.getId());
        assertThat(found.isPresent()).isTrue();
        assertThat(found.get().getAlertTitle()).isEqualTo("Tornado Alert");
    }
}
