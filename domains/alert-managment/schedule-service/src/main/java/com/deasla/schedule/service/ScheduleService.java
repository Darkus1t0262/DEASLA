package com.deasla.schedule.service;

import com.deasla.schedule.model.Schedule;
import com.deasla.schedule.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

// Repository and Singleton patterns (Spring's @Service is Singleton by default)
@Service
public class ScheduleService {

    private final ScheduleRepository scheduleRepository;

    @Autowired
    public ScheduleService(ScheduleRepository scheduleRepository) {
        this.scheduleRepository = scheduleRepository;
    }

    public Schedule createSchedule(Schedule schedule) {
        return scheduleRepository.save(schedule);
    }

    public List<Schedule> getAllSchedules() {
        return scheduleRepository.findAll();
    }

    public Optional<Schedule> getSchedule(Long id) {
        return scheduleRepository.findById(id);
    }

    public Schedule updateSchedule(Long id, Schedule scheduleDetails) {
        return scheduleRepository.findById(id).map(schedule -> {
            schedule.setAlertTitle(scheduleDetails.getAlertTitle());
            schedule.setScheduledAt(scheduleDetails.getScheduledAt());
            schedule.setStatus(scheduleDetails.getStatus());
            return scheduleRepository.save(schedule);
        }).orElse(null);
    }

    public boolean deleteSchedule(Long id) {
        if (!scheduleRepository.existsById(id)) return false;
        scheduleRepository.deleteById(id);
        return true;
    }
}
