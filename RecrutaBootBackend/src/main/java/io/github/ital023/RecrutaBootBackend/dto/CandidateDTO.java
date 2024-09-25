package io.github.ital023.RecrutaBootBackend.dto;


import io.github.ital023.RecrutaBootBackend.entities.Candidate;

public class CandidateDTO {
    private Long id;

    private String name;
    private String description;
    private String githubUsername;
    private GithubProfileDTO githubProfileDTO;

    public CandidateDTO() {
    }

    public CandidateDTO(Long id, String name, String description, String githubUsername, GithubProfileDTO githubProfileDTO) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.githubUsername = githubUsername;
        this.githubProfileDTO = githubProfileDTO;
    }

    public CandidateDTO(Candidate entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.description = entity.getDescription();
        this.githubProfileDTO = new GithubProfileDTO(entity.getGithubProfile().getAvatarUrl(), entity.getGithubProfile().getHtmlUrl());
        this.githubUsername = entity.getGithubUsername();
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getGithubUsername() {
        return githubUsername;
    }

    public GithubProfileDTO getGithubProfileDTO() {
        return githubProfileDTO;
    }
}
