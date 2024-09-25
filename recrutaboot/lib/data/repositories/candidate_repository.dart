import 'dart:convert';

import 'package:recrutaboot/data/http/exceptions.dart';
import 'package:recrutaboot/data/http/http_client.dart';
import 'package:recrutaboot/data/models/candidate_model.dart';

abstract class ICandidateRepository {
  Future<List<CandidateModel>> getCandidatesSortedByDate();
}

class CandidateRepository implements ICandidateRepository{

  final IHttpClient client;

  CandidateRepository({required this.client});

  @override
  Future<List<CandidateModel>> getCandidatesSortedByDate() async{
    final response = await client.get(url: "http://localhost:8080/candidate?size=3&page=0&sort=createdAt,desc&name=");
  
    if(response.statusCode == 200) {
      final List<CandidateModel> candidates = [];

      final body = jsonDecode(response.body);

      body['content'].map((item) {
        final CandidateModel candidate = CandidateModel.fromMap(item);
        candidates.add(candidate);
      }).toList();

      return candidates;

    }else if(response.statusCode == 404) {
      throw NotFoundException("A URL não está válida");
    }else {
      throw new Exception("Loading failed");
    }
  
  }


}