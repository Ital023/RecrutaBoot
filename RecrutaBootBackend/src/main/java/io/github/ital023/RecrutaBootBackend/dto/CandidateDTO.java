package io.github.ital023.RecrutaBootBackend.dto;


import io.github.ital023.RecrutaBootBackend.entities.Candidate;

public class CandidateDTO {
    private Long id;

    private String name;
    private String description;
    private String avatarUrl;

    public CandidateDTO() {
    }

    public CandidateDTO(Long id, String name, String description, String avatarUrl) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.avatarUrl = avatarUrl;
    }

    public CandidateDTO(Candidate entity) {
        this.id = entity.getId();
        this.name = entity.getName();
        this.description = entity.getDescription();
        this.avatarUrl = entity.getAvatarUrl();
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

    public String getAvatarUrl() {
        return avatarUrl;
    }
}
