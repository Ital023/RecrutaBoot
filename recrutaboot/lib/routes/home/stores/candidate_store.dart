import 'package:flutter/material.dart';
import 'package:recrutaboot/data/http/exceptions.dart';
import 'package:recrutaboot/data/models/candidate_model.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';

class CandidateStore {
  final ICandidateRepository repository;
  
  
  //loading
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  //state
  final ValueNotifier<List<CandidateModel>> state = ValueNotifier<List<CandidateModel>>([]); 

  //erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  CandidateStore({required this.repository});

  Future getCandidates() async {
    isLoading.value = true;

    try {

      final result = await repository.getCandidatesSortedByDate();
      state.value = result;

    } on NotFoundException catch (e) {
      erro.value = e.message;
    }
    catch(e) {
      erro.value = e.toString();
    }
    
    isLoading.value = false;

  }

}