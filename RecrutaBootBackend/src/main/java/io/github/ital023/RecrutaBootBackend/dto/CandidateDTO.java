package io.github.ital023.RecrutaBootBackend.dto;


import io.github.ital023.RecrutaBootBackend.entities.Candidate;

import java.time.Instant;

public class CandidateDTO {
    private Long id;

    private String name;
    private String occupation;
    private String description;
    private String githubUsername;
    private GithubProfileDTO githubProfile;
    private Instant createdAt;
    private String linkedinUrl;



    public CandidateDTO(Candidate entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.description = entity.getDescription();
        if(entity.getGithubProfile() != null) {
            this.githubProfile = new GithubProfileDTO(entity.getGithubProfile().getAvatarUrl(), entity.getGithubProfile().getHtmlUrl());
        }
        this.githubUsername = entity.getGithubUsername();
        this.createdAt = entity.getCreatedAt();
        this.occupation = entity.getOccupation();
        this.linkedinUrl = entity.getLinkedinUrl();
    }

    public CandidateDTO() {
    }

    public CandidateDTO(Long id, String name, String occupation, String description, String githubUsername, GithubProfileDTO githubProfile, Instant createdAt, String linkedinUrl) {
        this.id = id;
        this.name = name;
        this.occupation = occupation;
        this.description = description;
        this.githubUsername = githubUsername;
        this.githubProfile = githubProfile;
        this.createdAt = createdAt;
        this.linkedinUrl = linkedinUrl;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getOccupation() {
        return occupation;
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

    public String getLinkedinUrl() {
        return linkedinUrl;
    }
}
