import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';
import 'package:recrutaboot/components/header/drawer/custom_drawer_header.dart';

class CandidateIdPage extends StatelessWidget {
  
  const CandidateIdPage({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final String candidateId = GoRouterState.of(context).pathParameters['candidateId']!;

    // Capturar o candidateId da URL
    //final String candidateId = GoRouterState.of(context).pathParameters['candidateId']!;
    return Scaffold(
      appBar: AppBarCustom(),
      drawer: CustomDrawerHeader(),
      body: Center(
        child: Text('Detalhes do candidato com ID: ${candidateId}'),
      ),
    );
  }
}
