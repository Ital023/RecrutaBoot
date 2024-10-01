package io.github.ital023.RecrutaBootBackend.services;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.dto.GithubProfileDTO;
import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import io.github.ital023.RecrutaBootBackend.entities.GithubProfile;
import io.github.ital023.RecrutaBootBackend.repositories.GithubProfileRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import java.time.Instant;

@Service
public class GithubProfileService {

    @Autowired
    private GithubProfileRepository repository;

    @Autowired
    private RestTemplate restTemplate;

    @Transactional
    public GithubProfile insert(Candidate candidate) {
        GithubProfileDTO dto = searchGithubProfile(candidate.getGithubUsername());
        GithubProfile entity = new GithubProfile();

        copyDtoToEntity(dto, entity, candidate);

        entity = repository.save(entity);

        return entity;
    }

    @Transactional
    public void update(Long id, String githubUsername) {
        GithubProfile entity = repository.getReferenceById(id);

        GithubProfileDTO dto = searchGithubProfile(githubUsername);

        copyDtoToEntity(dto, entity);

        repository.save(entity);
    }

    private GithubProfileDTO searchGithubProfile(String githubUsername) {
        String apiUrl = "https://api.github.com/users/" + githubUsername;

        ResponseEntity<GithubProfileDTO> response = restTemplate.getForEntity(apiUrl, GithubProfileDTO.class);

        if(response.getStatusCode() == HttpStatus.OK) {
            return response.getBody();
        }
        throw new RuntimeException("Erro ao buscar o usuário do GitHub");
    }


    private void copyDtoToEntity(GithubProfileDTO dto, GithubProfile entity) {
        entity.setAvatarUrl(dto.getAvatarUrl());
        entity.setHtmlUrl(dto.getHtmlUrl());
    }

    private void copyDtoToEntity(GithubProfileDTO dto, GithubProfile entity, Candidate candidate) {
        entity.setAvatarUrl(dto.getAvatarUrl());
        entity.setHtmlUrl(dto.getHtmlUrl());
        entity.setCandidate(candidate);
    }

}
