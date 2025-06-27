package com.deasla.schedule;

import com.deasla.schedule.model.Schedule;
import com.deasla.schedule.repository.ScheduleRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import static org.assertj.core.api.Assertions.assertThat;

import java.time.LocalDateTime;

@SpringBootTest
class ScheduleServiceApplicationTests {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Test
    void testCreateAndFindSchedule() {
        Schedule schedule = new Schedule();
        schedule.setAlertTitle("Flood Warning");
        schedule.setScheduledAt(LocalDateTime.now().plusHours(1));
        schedule.setStatus("PENDING");
        scheduleRepository.save(schedule);

        var found = scheduleRepository.findById(schedule.getId());
        assertThat(found.isPresent()).isTrue();
        assertThat(found.get().getAlertTitle()).isEqualTo("Flood Warning");
    }
}
