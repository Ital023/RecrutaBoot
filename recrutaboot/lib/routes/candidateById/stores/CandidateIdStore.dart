import 'package:flutter/material.dart';
import 'package:recrutaboot/data/http/exceptions.dart';
import 'package:recrutaboot/data/models/candidate_model.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';

class Candidateidstore {
  final ICandidateRepository repository;
  
  //loading
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  //state
  final ValueNotifier<CandidateModel?> state = ValueNotifier<CandidateModel?>(null); 

  //erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Candidateidstore({required this.repository});

  Future getCandidateById(int id) async {
    isLoading.value = true;

    try {
      print("Antes da persistencia: ${state.value}");

      final result = await repository.getCandidateById(id);
      state.value = result;
      print("Depois da persistencia: ${state.value}");

    } on NotFoundException catch (e) {
      erro.value = e.message;
      print("${e.message}");
    }
    catch(e) {
      erro.value = e.toString();
      print("Erro ta vindo daqui: ${e.toString()}");
    }

    isLoading.value = false;

  }
}