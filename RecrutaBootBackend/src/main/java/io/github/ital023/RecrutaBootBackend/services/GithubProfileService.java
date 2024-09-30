package io.github.ital023.RecrutaBootBackend.services;

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

@Service
public class GithubProfileService {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private GithubProfileRepository repository;

    @Transactional
    public GithubProfile insert(String githubUsername, Candidate candidate) {
        GithubProfileDTO dto = searchGithubProfile(githubUsername);
        GithubProfile githubProfile = new GithubProfile();

        copyDtoToEntity(dto, githubProfile, candidate);

        githubProfile = repository.save(githubProfile);

        return githubProfile;
    }

    private GithubProfileDTO searchGithubProfile(String githubUsername) {

        String apiUrl = "https://api.github.com/users/" + githubUsername;

        ResponseEntity<GithubProfileDTO> response = restTemplate.getForEntity(apiUrl, GithubProfileDTO.class);

        if (response.getStatusCode() == HttpStatus.OK) {
            return response.getBody();
        }
        throw new RuntimeException("Erro ao buscar o usuário do GitHub");
    }

    private void copyDtoToEntity(GithubProfileDTO dto, GithubProfile entity, Candidate candidate) {
        entity.setAvatarUrl(dto.getAvatarUrl());
        entity.setHtmlUrl(dto.getHtmlUrl());
        entity.setCandidate(candidate);
    }


}

