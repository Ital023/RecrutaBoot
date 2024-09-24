package io.github.ital023.RecrutaBootBackend.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToOne;
import org.springframework.web.bind.annotation.RequestMapping;

@Entity
@RequestMapping(name = "tb_github_profile")
public class GithubProfile {

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
