import 'package:recrutaboot/data/models/github_profile_model.dart';

class CandidateMinModel {
  final int id;
  final String name;
  final String occupation;
  final String githubUsername;
  final GithubProfile githubProfile;
  final bool isFavorite;

  CandidateMinModel({
    required this.id,
    required this.name,
    required this.occupation,
    required this.githubUsername,
    required this.githubProfile,
    required this.isFavorite,

  });

  factory CandidateMinModel.fromMap(Map<String, dynamic> map) {
    return CandidateMinModel(
      id: map['id'],
      name: map['name'],
      occupation: map['occupation'],
      githubUsername: map['githubUsername'],
      githubProfile: GithubProfile.fromMap(map['githubProfile']),
      isFavorite: map['favorite'],
    );
  }
}