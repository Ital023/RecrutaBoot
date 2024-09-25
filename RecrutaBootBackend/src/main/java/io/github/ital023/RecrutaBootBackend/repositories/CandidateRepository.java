package io.github.ital023.RecrutaBootBackend.repositories;

import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CandidateRepository extends JpaRepository<Candidate, Long> {

    @Query("SELECT obj FROM Candidate obj " +
            "WHERE UPPER(obj.name) LIKE UPPER(CONCAT('%', :name ,'%'))")
    Page<Candidate> searchByName(String name, Pageable pageable);


}
