package io.github.ital023.RecrutaBootBackend.entities;
import jakarta.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "tb_candidate")
public class Candidate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String occupation;

    @Column(length = 250)
    private String description;

    private String githubUsername;

    private String linkedinUrl;

    private boolean favorite;

    @OneToOne(mappedBy = "candidate", cascade = CascadeType.ALL)
    private GithubProfile githubProfile;

    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant createdAt;

    @Column(columnDefinition = "TIMESTAMP WITHOUT TIME ZONE")
    private Instant updatedAt;

    public Candidate() {
    }

    public Candidate(Long id, String name, String occupation, String description, String githubUsername, String linkedinUrl, boolean favorite, GithubProfile githubProfile, Instant createdAt, Instant updatedAt) {
        this.id = id;
        this.name = name;
        this.occupation = occupation;
        this.description = description;
        this.githubUsername = githubUsername;
        this.linkedinUrl = linkedinUrl;
        this.favorite = favorite;
        this.githubProfile = githubProfile;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getGithubUsername() {
        return githubUsername;
    }

    public void setGithubUsername(String githubUsername) {
        this.githubUsername = githubUsername;
    }

    public GithubProfile getGithubProfile() {
        return githubProfile;
    }

    public void setGithubProfile(GithubProfile githubProfile) {
        this.githubProfile = githubProfile;
    }

    public Instant getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Instant createdAt) {
        this.createdAt = createdAt;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getLinkedinUrl() {
        return linkedinUrl;
    }

    public void setLinkedinUrl(String linkedinUrl) {
        this.linkedinUrl = linkedinUrl;
    }

    public boolean isFavorite() {
        return favorite;
    }
    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }

    public Instant getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Instant updatedAt) {
        this.updatedAt = updatedAt;
    }
}
