class GithubProfile {
  final String avatarUrl;
  final String htmlUrl;

  GithubProfile({required this.avatarUrl, required this.htmlUrl});

  factory GithubProfile.fromMap(Map<String, dynamic> map) {
    return GithubProfile(
      avatarUrl: map['avatar_url'],
      htmlUrl: map['html_url'],
    );
  }
}