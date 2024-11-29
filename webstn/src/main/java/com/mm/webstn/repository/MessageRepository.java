package com.mm.aero.repositories;

import com.mm.aero.domain.HistoryMessage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<HistoryMessage, Long> {
}