package io.github.ital023.RecrutaBootBackend.dto;

public class GithubUserDTO {

    private String avatar_url;
    private String html_url;

    public GithubUserDTO() {
    }

    public GithubUserDTO(String avatar_url, String html_url) {
        this.avatar_url = avatar_url;
        this.html_url = html_url;
    }

    public String getHtml_url() {
        return html_url;
    }

    public void setHtml_url(String html_url) {
        this.html_url = html_url;
    }

    public String getAvatar_url() {
        return avatar_url;
    }

    public void setAvatar_url(String avatar_url) {
        this.avatar_url = avatar_url;
    }
}
