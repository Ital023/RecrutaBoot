package io.github.ital023.RecrutaBootBackend.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "tb_candidate")
public class Candidate {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;
    private String githubUsername;

    @OneToOne(mappedBy = "candidate", cascade = CascadeType.ALL)
    private GithubProfile githubProfile;


    public Candidate() {
    }

    public Candidate(Long id, String name, String description, String githubUsername, GithubProfile githubProfile) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.githubUsername = githubUsername;
        this.githubProfile = githubProfile;
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
}
