package io.github.ital023.RecrutaBootBackend.services;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.dto.GithubUserDTO;
import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import io.github.ital023.RecrutaBootBackend.repositories.CandidateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;

@Service
public class CandidateService {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private CandidateRepository repository;

    public List<CandidateDTO> getAll() {
        List<Candidate> candidates = repository.findAll();
        return candidates.stream().map(x -> new CandidateDTO(x)).toList();
    }

    private GithubUserDTO searchGithubProfile(String githubUsername) {
        String apiUrl = "https://api.github.com/users/" + githubUsername;

        ResponseEntity<GithubUserDTO> response = restTemplate.getForEntity(apiUrl, GithubUserDTO.class);

        if(response.getStatusCode() == HttpStatus.OK) {
            return response.getBody();
        }
        throw new RuntimeException("Erro ao buscar o usuário do GitHub");
    }

}
