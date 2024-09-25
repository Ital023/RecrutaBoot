package io.github.ital023.RecrutaBootBackend.entities;

import jakarta.persistence.*;
import org.springframework.web.bind.annotation.RequestMapping;

@Entity
@Table(name = "tb_github_profile")
public class GithubProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @MapsId
    private Candidate candidate;

    @Column(columnDefinition = "TEXT")
    private String avatarUrl;

    @Column(columnDefinition = "TEXT")
    private String htmlUrl;

    public GithubProfile() {
    }

    public GithubProfile(String avatarUrl, String htmlUrl) {
        this.avatarUrl = avatarUrl;
        this.htmlUrl = htmlUrl;
    }

    public Candidate getCandidate() {
        return candidate;
    }

    public void setCandidate(Candidate candidate) {
        this.candidate = candidate;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public void setAvatarUrl(String avatarUrl) {
        this.avatarUrl = avatarUrl;
    }

    public String getHtmlUrl() {
        return htmlUrl;
    }

    public void setHtmlUrl(String htmlUrl) {
        this.htmlUrl = htmlUrl;
    }
}
