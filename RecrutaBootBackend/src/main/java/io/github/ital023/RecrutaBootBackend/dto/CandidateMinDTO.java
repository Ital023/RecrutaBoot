package io.github.ital023.RecrutaBootBackend.dto;


import io.github.ital023.RecrutaBootBackend.entities.Candidate;

import java.time.Instant;

public class CandidateMinDTO {
    private Long id;

    private String name;
    private String description;
    private String githubUsername;
    private GithubProfileDTO githubProfile;
    private Instant createdAt;

    public CandidateMinDTO() {
    }

    public CandidateMinDTO(Long id, String name, String description, String githubUsername, GithubProfileDTO githubProfile, Instant createdAt) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.githubUsername = githubUsername;
        this.githubProfile = githubProfile;
        this.createdAt = createdAt;
    }

    public CandidateMinDTO(Candidate entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.description = entity.getDescription();
        if(entity.getGithubProfile() != null) {
            this.githubProfile = new GithubProfileDTO(entity.getGithubProfile().getAvatarUrl(), entity.getGithubProfile().getHtmlUrl());
        }
        this.githubUsername = entity.getGithubUsername();
        this.createdAt = entity.getCreatedAt();
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

    public GithubProfileDTO getGithubProfile() {
        return githubProfile;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }
}
