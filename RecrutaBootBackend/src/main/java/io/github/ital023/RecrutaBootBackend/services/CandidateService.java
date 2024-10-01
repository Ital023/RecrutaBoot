package io.github.ital023.RecrutaBootBackend.services;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.dto.CandidateMinDTO;
import io.github.ital023.RecrutaBootBackend.dto.GithubProfileDTO;
import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import io.github.ital023.RecrutaBootBackend.entities.GithubProfile;
import io.github.ital023.RecrutaBootBackend.repositories.CandidateRepository;
import io.github.ital023.RecrutaBootBackend.services.exceptions.DatabaseException;
import io.github.ital023.RecrutaBootBackend.services.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.time.Instant;
import java.util.List;

@Service
public class CandidateService {

    @Autowired
    private GithubProfileService githubProfileService;

    @Autowired
    private CandidateRepository repository;

    @Transactional(readOnly = true)
    public List<CandidateMinDTO> findAll() {
        List<Candidate> candidates = repository.findAll();
        return candidates.stream().map(x -> new CandidateMinDTO(x)).toList();
    }

    @Transactional(readOnly = true)
    public Page<CandidateMinDTO> getAll(String name, Pageable pageable) {
        Page<Candidate> candidates = repository.searchByName(name, pageable);
        return candidates.map(x -> new CandidateMinDTO(x));
    }

    @Transactional(readOnly = true)
    public CandidateDTO getById(Long id) {
        Candidate candidate = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario não encontrado"));

        return new CandidateDTO(candidate);
    }

    @Transactional
    public CandidateDTO save(CandidateDTO candidateDTO){
        GithubProfileDTO response = null;

        Candidate candidate = new Candidate();
        candidate.setCreatedAt(Instant.now());
        copyDtoToEntity(candidateDTO, candidate);
        candidate.setFavorite(false);


        if(!candidateDTO.getGithubUsername().isEmpty()){
            GithubProfile githubProfile = githubProfileService.insert(candidate);
            candidate.setGithubProfile(githubProfile);
        }

        candidate = repository.save(candidate);

        return new CandidateDTO(candidate);
    }

    @Transactional
    public CandidateDTO update(CandidateDTO dto, Long id) {
        Candidate entity = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario não encontrado"));

        if(!dto.getGithubUsername().trim().equals(entity.getGithubUsername().trim())) {
            githubProfileService.update(entity.getId(), dto.getGithubUsername());
        }

        copyDtoToEntity(dto, entity);

        entity = repository.save(entity);


        return new CandidateDTO(entity);
    }

    @Transactional
    public void updateFavorite(Long id){
        try{
            Candidate candidate = repository.getReferenceById(id);

            candidate.setFavorite(!candidate.isFavorite());
            candidate.setUpdatedAt(Instant.now());

            candidate = repository.save(candidate);
        }catch (EntityNotFoundException e){
            throw new ResourceNotFoundException("Usuario nao encontrado");
        }
    }

    @Transactional(readOnly = true)
    public List<CandidateMinDTO> getAllFavorites() {
        List<Candidate> candidates = repository.searchFavorites();

        return candidates.stream().map(x -> new CandidateMinDTO(x)).toList();
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    public void delete(Long id){
        if(!repository.existsById(id)){
            throw new ResourceNotFoundException("Recurso não encontrado");
        }
        try{
            repository.deleteById(id);
        }catch (DataIntegrityViolationException e){
            throw new DatabaseException("Falha na integridade referencial");
        }

    }


    private void copyDtoToEntityMin(CandidateMinDTO candidateMinDTO, Candidate candidate, GithubProfileDTO response) {
        candidate.setName(candidateMinDTO.getName());
        candidate.setOccupation(candidateMinDTO.getOccupation());
        candidate.setGithubUsername(candidateMinDTO.getGithubUsername());
        candidate.setFavorite(candidateMinDTO.isFavorite());
        candidate.setCreatedAt(Instant.now());
        candidate.setUpdatedAt(Instant.now());
        if(response != null) {
            candidate.setGithubProfile(new GithubProfile(response.getAvatarUrl(), response.getHtmlUrl()));
        }
    }

    private void copyDtoToEntity(CandidateDTO candidateDTO, Candidate candidate) {
        candidate.setName(candidateDTO.getName());
        candidate.setOccupation(candidateDTO.getOccupation());
        candidate.setGithubUsername(candidateDTO.getGithubUsername());
        candidate.setDescription(candidateDTO.getDescription());
        candidate.setUpdatedAt(Instant.now());
        candidate.setLinkedinUrl(candidateDTO.getLinkedinUrl());
        candidate.setFavorite(candidateDTO.isFavorite());
    }


}
