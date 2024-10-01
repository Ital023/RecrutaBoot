import 'package:flutter/material.dart';
import 'package:recrutaboot/data/http/exceptions.dart';
import 'package:recrutaboot/data/models/candidate_min_model.dart';
import 'package:recrutaboot/data/models/candidate_model.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';

class Editcandidatestore {
  final ICandidateRepository repository;
  
  //loading
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  //state
  final ValueNotifier<CandidateModel?> state = ValueNotifier<CandidateModel?>(null); 

  //erro
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  Editcandidatestore({required this.repository});

  Future getCandidateById(int id) async {
    isLoading.value = true;

    try {
      final result = await repository.getCandidateById(id);
      state.value = result;

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

  Future updatedFavorite(int id) async{
    try{
      await repository.updatedFavorite(id);

    }catch(e) {
      erro.value = e.toString();
      print("Erro ta vindo daqui: ${e.toString()}");
    }
  }
}