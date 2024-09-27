import 'package:recrutaboot/data/models/github_profile_model.dart';

class CandidateModel {
  final int id;
  final String name;
  final String occupation;
  final String description;
  final String githubUsername;
  final GithubProfile githubProfile;
  final String linkedinUrl;

  CandidateModel({
    required this.id,
    required this.name,
    required this.occupation,
    required this.description,
    required this.githubUsername,
    required this.githubProfile,
    required this.linkedinUrl,

  });

  factory CandidateModel.fromMap(Map<String, dynamic> map) {
    return CandidateModel(
      id: map['id'],
      name: map['name'],
      occupation: map['occupation'],
      description: map['description'],
      githubUsername: map['githubUsername'],
      githubProfile: GithubProfile.fromMap(map['githubProfile']),
      linkedinUrl: map['linkedinUrl']
    );
  }
}