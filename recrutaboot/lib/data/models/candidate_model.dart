import 'package:recrutaboot/data/models/github_profile_model.dart';

class CandidateModel {
  final int id;
  final String name;
  final String occupation;
  final String description;
  final String githubUsername;
  final GithubProfile githubProfile;
  final String linkedinUrl;
  final bool isFavorite;


  CandidateModel({
    required this.id,
    required this.name,
    required this.occupation,
    required this.description,
    required this.githubUsername,
    required this.githubProfile,
    required this.linkedinUrl,
    required this.isFavorite,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'occupation': occupation,
      'description': description,
      'githubUsername': githubUsername,
      'linkedinUrl': linkedinUrl
    };
  }

  factory CandidateModel.fromMap(Map<String, dynamic> map) {
    return CandidateModel(
      id: map['id'],
      name: map['name'],
      occupation: map['occupation'],
      description: map['description'],
      githubUsername: map['githubUsername'],
      githubProfile: GithubProfile.fromMap(map['githubProfile']),
      linkedinUrl: map['linkedinUrl'],
      isFavorite: map['favorite']
    );
  }
}

class CandidateModelCreate {
  final String name;
  final String occupation;
  final String description;
  final String githubUsername;
  final String linkedinUrl;

  CandidateModelCreate({
    required this.name,
    required this.occupation,
    required this.description,
    required this.githubUsername,
    required this.linkedinUrl,
  });

factory CandidateModelCreate.fromMap(Map<String, dynamic> map) {
    return CandidateModelCreate(
      name: map['name'],
      occupation: map['occupation'],
      description: map['description'],
      githubUsername: map['githubUsername'],
      linkedinUrl: map['linkedinUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'occupation': occupation,
      'description': description,
      'githubUsername': githubUsername,
      'linkedinUrl': linkedinUrl
    };
  }

}