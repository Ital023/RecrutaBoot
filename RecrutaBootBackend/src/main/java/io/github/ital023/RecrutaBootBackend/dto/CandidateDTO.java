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
    private Instant updatedAt;
    private String linkedinUrl;
    private boolean favorite;


    public CandidateDTO(Candidate entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.description = entity.getDescription();
        if(entity.getGithubProfile() != null) {
            this.githubProfile = new GithubProfileDTO(entity.getGithubProfile().getAvatarUrl(), entity.getGithubProfile().getHtmlUrl());
        }
        this.githubUsername = entity.getGithubUsername();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
        this.occupation = entity.getOccupation();
        this.linkedinUrl = entity.getLinkedinUrl();
        this.favorite = entity.isFavorite();
    }

    public CandidateDTO() {
    }

    public CandidateDTO(Long id, String name, String occupation, String description, String githubUsername, GithubProfileDTO githubProfile, Instant createdAt, Instant updatedAt, String linkedinUrl, boolean favorite) {
        this.id = id;
        this.name = name;
        this.occupation = occupation;
        this.description = description;
        this.githubUsername = githubUsername;
        this.githubProfile = githubProfile;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.linkedinUrl = linkedinUrl;
        this.favorite = favorite;
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

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public String getLinkedinUrl() {
        return linkedinUrl;
    }

    public boolean isFavorite() {
        return favorite;
    }
}
