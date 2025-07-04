package com.deasla.alert.repository;

import com.deasla.alert.model.Alert;
import org.springframework.data.cassandra.repository.CassandraRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface AlertRepository extends CassandraRepository<Alert, UUID> {
}
