package io.github.ital023.RecrutaBootBackend.services;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.dto.CandidateMinDTO;
import io.github.ital023.RecrutaBootBackend.dto.GithubProfileDTO;
import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import io.github.ital023.RecrutaBootBackend.entities.GithubProfile;
import io.github.ital023.RecrutaBootBackend.repositories.CandidateRepository;
import io.github.ital023.RecrutaBootBackend.services.exceptions.ResourceNotFoundException;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.time.Instant;
import java.util.List;

@Service
public class CandidateService {

    @Autowired
    private RestTemplate restTemplate;

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

        if(!candidateDTO.getGithubUsername().isEmpty()){
            response = searchGithubProfile(candidateDTO.getGithubUsername());
        }

        Candidate candidate = new Candidate();

        copyDtoToEntity(candidateDTO, candidate, response);

        if(response != null) {
            candidate.getGithubProfile().setCandidate(candidate);
        }

        candidate.setFavorite(false);

        candidate = repository.save(candidate);

        return new CandidateDTO(candidate);
    }

    @Transactional
    public CandidateDTO updateFavorite(Long id){
        try{
            Candidate candidate = repository.getReferenceById(id);

            candidate.setFavorite(!candidate.isFavorite());
            candidate.setUpdatedAt(Instant.now());

            candidate = repository.save(candidate);

            return new CandidateDTO(candidate);
        }catch (EntityNotFoundException e){
            throw new ResourceNotFoundException("Usuario nao encontrado");
        }
    }

    private GithubProfileDTO searchGithubProfile(String githubUsername) {
        String apiUrl = "https://api.github.com/users/" + githubUsername;

        ResponseEntity<GithubProfileDTO> response = restTemplate.getForEntity(apiUrl, GithubProfileDTO.class);

        if(response.getStatusCode() == HttpStatus.OK) {
            return response.getBody();
        }
        throw new RuntimeException("Erro ao buscar o usuário do GitHub");
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

    private void copyDtoToEntity(CandidateDTO candidateDTO, Candidate candidate, GithubProfileDTO response) {
        candidate.setName(candidateDTO.getName());
        candidate.setOccupation(candidateDTO.getOccupation());
        candidate.setGithubUsername(candidateDTO.getGithubUsername());
        candidate.setDescription(candidateDTO.getDescription());
        candidate.setCreatedAt(Instant.now());
        candidate.setUpdatedAt(Instant.now());
        if(response != null) {
            candidate.setGithubProfile(new GithubProfile(response.getAvatarUrl(), response.getHtmlUrl()));
        }
        candidate.setLinkedinUrl(candidateDTO.getLinkedinUrl());
        candidate.setFavorite(candidateDTO.isFavorite());
    }


}
