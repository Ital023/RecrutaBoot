package io.github.ital023.RecrutaBootBackend.dto;


import io.github.ital023.RecrutaBootBackend.entities.Candidate;

import java.time.Instant;

public class CandidateMinDTO {
    private Long id;

    private String name;
    private String occupation;
    private String githubUsername;
    private GithubProfileDTO githubProfile;
    private boolean favorite;
    private Instant createdAt;
    private Instant updatedAt;


    public CandidateMinDTO() {
    }

    public CandidateMinDTO(Long id, String name, String occupation, String githubUsername, GithubProfileDTO githubProfile, boolean favorite, Instant createdAt, Instant updatedAt) {
        this.id = id;
        this.name = name;
        this.occupation = occupation;
        this.githubUsername = githubUsername;
        this.githubProfile = githubProfile;
        this.favorite = favorite;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public CandidateMinDTO(Candidate entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.occupation = entity.getOccupation();
        if(entity.getGithubProfile() != null) {
            this.githubProfile = new GithubProfileDTO(entity.getGithubProfile().getAvatarUrl(), entity.getGithubProfile().getHtmlUrl());
        }
        this.githubUsername = entity.getGithubUsername();
        this.favorite = entity.isFavorite();
        this.createdAt = entity.getCreatedAt();
        this.updatedAt = entity.getUpdatedAt();
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

    public String getGithubUsername() {
        return githubUsername;
    }

    public GithubProfileDTO getGithubProfile() {
        return githubProfile;
    }

    public boolean isFavorite() {
        return favorite;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

}
