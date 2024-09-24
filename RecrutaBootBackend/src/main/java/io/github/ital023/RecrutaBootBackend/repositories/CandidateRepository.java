package io.github.ital023.RecrutaBootBackend.repositories;

import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CandidateRepository extends JpaRepository<Candidate, Long> {
}
