package io.github.ital023.RecrutaBootBackend.services;

import io.github.ital023.RecrutaBootBackend.dto.CandidateMinDTO;
import io.github.ital023.RecrutaBootBackend.dto.GithubProfileDTO;
import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import io.github.ital023.RecrutaBootBackend.entities.GithubProfile;
import io.github.ital023.RecrutaBootBackend.repositories.CandidateRepository;
import io.github.ital023.RecrutaBootBackend.services.exceptions.ResourceNotFoundException;
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
    public CandidateMinDTO getById(Long id) {
        Candidate candidate = repository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario não encontrado"));

        return new CandidateMinDTO(candidate);
    }

    @Transactional
    public CandidateMinDTO save(CandidateMinDTO candidateMinDTO){
        GithubProfileDTO response = null;

        if(!candidateMinDTO.getGithubUsername().isEmpty()){
            response = searchGithubProfile(candidateMinDTO.getGithubUsername());
        }

        Candidate candidate = new Candidate();

        copyDtoToEntity(candidateMinDTO, candidate, response);

        if(response != null) {
            candidate.getGithubProfile().setCandidate(candidate);
        }

        candidate = repository.save(candidate);

        return new CandidateMinDTO(candidate);
    }

    private GithubProfileDTO searchGithubProfile(String githubUsername) {
        String apiUrl = "https://api.github.com/users/" + githubUsername;

        ResponseEntity<GithubProfileDTO> response = restTemplate.getForEntity(apiUrl, GithubProfileDTO.class);

        if(response.getStatusCode() == HttpStatus.OK) {
            return response.getBody();
        }
        throw new RuntimeException("Erro ao buscar o usuário do GitHub");
    }

    private void copyDtoToEntity(CandidateMinDTO candidateMinDTO, Candidate candidate, GithubProfileDTO response) {
        candidate.setName(candidateMinDTO.getName());
        candidate.setDescription(candidateMinDTO.getDescription());
        candidate.setGithubUsername(candidateMinDTO.getGithubUsername());
        candidate.setCreatedAt(Instant.now());
        if(response != null) {
            candidate.setGithubProfile(new GithubProfile(response.getAvatarUrl(), response.getHtmlUrl()));
        }
    }


}
