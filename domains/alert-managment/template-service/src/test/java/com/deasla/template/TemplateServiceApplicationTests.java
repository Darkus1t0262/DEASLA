package com.deasla.template;

import com.deasla.template.model.Template;
import com.deasla.template.repository.TemplateRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class TemplateServiceApplicationTests {

    @Autowired
    private TemplateRepository templateRepository;

    @Test
    void testCreateAndFindTemplate() {
        Template template = new Template();
        template.setName("Urgent");
        template.setTitle("ALERT");
        template.setBody("Evacuate now!");
        template.setVariables("{location}");

        templateRepository.save(template);

        var found = templateRepository.findById(template.getId());
        assertThat(found.isPresent()).isTrue();
        assertThat(found.get().getName()).isEqualTo("Urgent");
    }
}
