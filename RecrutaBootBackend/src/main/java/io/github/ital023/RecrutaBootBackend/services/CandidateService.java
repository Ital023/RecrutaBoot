package io.github.ital023.RecrutaBootBackend.services;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import io.github.ital023.RecrutaBootBackend.repositories.CandidateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CandidateService {

    @Autowired
    private CandidateRepository repository;

    public List<CandidateDTO> findAll() {
        List<Candidate> candidates = repository.findAll();
        return candidates.stream().map(x -> new CandidateDTO(x)).toList();
    }

}
