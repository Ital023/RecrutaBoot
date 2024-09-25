package io.github.ital023.RecrutaBootBackend.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

public class GithubProfileDTO {

    @JsonProperty("avatar_url")
    private String avatarUrl;

    @JsonProperty("html_url")
    private String htmlUrl;

    public GithubProfileDTO() {
    }

    public GithubProfileDTO(String avatarUrl, String htmlUrl) {
        this.avatarUrl = avatarUrl;
        this.htmlUrl = htmlUrl;
    }

    public String getAvatarUrl() {
        return avatarUrl;
    }

    public String getHtmlUrl() {
        return htmlUrl;
    }

    @Override
    public String toString() {
        return "GithubProfileDTO{" +
                "avatarUrl='" + avatarUrl + '\'' +
                ", htmlUrl='" + htmlUrl + '\'' +
                '}';
    }
}
