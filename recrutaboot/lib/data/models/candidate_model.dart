import 'package:recrutaboot/data/models/github_profile_model.dart';

class CandidateModel {
  final int id;
  final String name;
  final String description;
  final String githubUsername;
  final GithubProfile githubProfile;

  CandidateModel({
    required this.id,
    required this.name,
    required this.description,
    required this.githubUsername,
    required this.githubProfile,
  });

  factory CandidateModel.fromMap(Map<String, dynamic> map) {
    return CandidateModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      githubUsername: map['githubUsername'],
      githubProfile: GithubProfile.fromMap(map['githubProfile']),
    );
  }
}