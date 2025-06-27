package com.deasla.template.service;

import com.deasla.template.model.Template;
import com.deasla.template.repository.TemplateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

// Repository and Singleton patterns (Spring's @Service is Singleton by default)
@Service
public class TemplateService {

    private final TemplateRepository templateRepository;

    @Autowired
    public TemplateService(TemplateRepository templateRepository) {
        this.templateRepository = templateRepository;
    }

    public Template createTemplate(Template template) {
        return templateRepository.save(template);
    }

    public List<Template> getAllTemplates() {
        return templateRepository.findAll();
    }

    public Optional<Template> getTemplate(Long id) {
        return templateRepository.findById(id);
    }

    public Template updateTemplate(Long id, Template templateDetails) {
        return templateRepository.findById(id).map(template -> {
            template.setName(templateDetails.getName());
            template.setTitle(templateDetails.getTitle());
            template.setBody(templateDetails.getBody());
            template.setVariables(templateDetails.getVariables());
            return templateRepository.save(template);
        }).orElse(null);
    }

    public boolean deleteTemplate(Long id) {
        if (!templateRepository.existsById(id)) return false;
        templateRepository.deleteById(id);
        return true;
    }
}
