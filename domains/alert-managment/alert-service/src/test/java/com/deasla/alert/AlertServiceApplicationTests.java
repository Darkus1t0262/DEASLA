package com.deasla.alert;

import com.deasla.alert.model.Alert;
import com.deasla.alert.repository.AlertRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class AlertServiceApplicationTests {

    @Autowired
    private AlertRepository alertRepository;

    @Test
    void testCreateAndFindAlert() {
        Alert alert = new Alert();
        alert.setTitle("Test Alert");
        alert.setMessage("This is a test");
        alert.setSeverity("High");
        alert.setArea("Region1");
        alertRepository.save(alert);

        var found = alertRepository.findById(alert.getId());
        assertThat(found.isPresent()).isTrue();
        assertThat(found.get().getTitle()).isEqualTo("Test Alert");
    }
}
