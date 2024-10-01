import 'dart:convert';

import 'package:recrutaboot/data/http/exceptions.dart';
import 'package:recrutaboot/data/http/http_client.dart';
import 'package:recrutaboot/data/models/candidate_min_model.dart';
import 'package:recrutaboot/data/models/candidate_model.dart';

abstract class ICandidateRepository {
  Future<List<CandidateMinModel>> getCandidatesSortedByDate();
  Future<List<CandidateMinModel>> getCandidates();
  Future<CandidateModel> getCandidateById(int id);
  Future<void> updatedFavorite(int id);
  Future<List<CandidateMinModel>> getFavorites();
  Future<void> createCandidate(CandidateModelCreate candidate);
  Future<void> deleteCandidate(int id);
  Future<void> updateCandidate(CandidateModelCreate candidate, int id);



}

class CandidateRepository implements ICandidateRepository {
  final IHttpClient client;

  CandidateRepository({required this.client});

  @override
  Future<List<CandidateMinModel>> getCandidates() async {
    final response = await client.get(url: "http://10.0.2.2:8080/candidate");

    if (response.statusCode == 200) {
      final List<CandidateMinModel> candidates = [];
      final body = jsonDecode(response.body);

      body.map((item) {
        final CandidateMinModel candidate = CandidateMinModel.fromMap(item);
        candidates.add(candidate);
      }).toList();
      return candidates;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A URL não está válida");
    } else {
      throw new Exception("Loading failed");
    }
  }

  @override
  Future<List<CandidateMinModel>> getCandidatesSortedByDate() async {
    final response = await client.get(
        url:
            "http://10.0.2.2:8080/candidate/pageable?size=3&page=0&sort=updatedAt,desc&name=");

    if (response.statusCode == 200) {
      final List<CandidateMinModel> candidates = [];

      final body = jsonDecode(response.body);

      body['content'].map((item) {
        final CandidateMinModel candidate = CandidateMinModel.fromMap(item);
        candidates.add(candidate);
      }).toList();
      return candidates;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A URL não está válida");
    } else {
      throw new Exception("Loading failed");
    }
  }
  
  @override
  Future<CandidateModel> getCandidateById(int id) async {
    final response = await client.get(url: "http://10.0.2.2:8080/candidate/${id}");

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final CandidateModel candidate = CandidateModel.fromMap(body);
        
      return candidate;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A URL não está válida");
    } else {
      throw new Exception("Loading failed");
    }
    
  }
  
  @override
  Future<void> updatedFavorite(int id) async {
     final response = await client.putUpatedFavorite(url: "http://10.0.2.2:8080/candidate/favorite/${id}");

     if(response.statusCode == 204) {
      return;
     }else {
      throw Exception('Erro ao atualizar favorito');

     }

  }
  
  @override
  Future<List<CandidateMinModel>> getFavorites() async {
    final response = await client.get(url: "http://10.0.2.2:8080/candidate/favorite");

    if (response.statusCode == 200) {
      final List<CandidateMinModel> candidates = [];
      final body = jsonDecode(response.body);

      body.map((item) {
        final CandidateMinModel candidate = CandidateMinModel.fromMap(item);
        candidates.add(candidate);
      }).toList();
      return candidates;
    } else if (response.statusCode == 404) {
      throw NotFoundException("A URL não está válida");
    } else {
      throw new Exception("Loading failed");
    }
  }
  
  @override
  Future<void> createCandidate(CandidateModelCreate candidate) async {
    final body = candidate.toMap();

    final response = await client.post(
      url: "http://10.0.2.2:8080/candidate",
      body: body,
    );

    if (response.statusCode == 201) {
    } else {
      throw Exception("Erro ao criar candidato");
    }
  }

  @override
  Future<void> updateCandidate(CandidateModelCreate candidate, int id) async {
    final body = candidate.toMap();

    final response = await client.put(
      url: "http://10.0.2.2:8080/candidate/${id}",
      body: body,
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception("Erro ao editar candidato");
    }
  }
  
  @override
  Future<void> deleteCandidate(int id) async {
    final response = await client.delete(url: "http://10.0.2.2:8080/candidate/${id}");

     if(response.statusCode == 204) {
      return;
     }else {
      throw Exception('Erro ao deletar favorito');

    }
  }


}