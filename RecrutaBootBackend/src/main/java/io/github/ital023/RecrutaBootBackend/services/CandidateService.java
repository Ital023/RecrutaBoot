package io.github.ital023.RecrutaBootBackend.services;

import io.github.ital023.RecrutaBootBackend.dto.CandidateDTO;
import io.github.ital023.RecrutaBootBackend.dto.GithubProfileDTO;
import io.github.ital023.RecrutaBootBackend.entities.Candidate;
import io.github.ital023.RecrutaBootBackend.entities.GithubProfile;
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

        candidate = repository.save(candidate);

        return new CandidateDTO(candidate);
    }

    private GithubProfileDTO searchGithubProfile(String githubUsername) {
        String apiUrl = "https://api.github.com/users/" + githubUsername;

        ResponseEntity<GithubProfileDTO> response = restTemplate.getForEntity(apiUrl, GithubProfileDTO.class);

        if(response.getStatusCode() == HttpStatus.OK) {
            return response.getBody();
        }
        throw new RuntimeException("Erro ao buscar o usuário do GitHub");
    }

    private void copyDtoToEntity(CandidateDTO candidateDTO, Candidate candidate, GithubProfileDTO response) {
        candidate.setName(candidateDTO.getName());
        candidate.setDescription(candidateDTO.getDescription());
        candidate.setGithubUsername(candidateDTO.getGithubUsername());
        if(response != null) {
            candidate.setGithubProfile(new GithubProfile(response.getAvatarUrl(), response.getHtmlUrl()));
        }
    }

}
