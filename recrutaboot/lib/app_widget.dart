import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recrutaboot/routes/candidateById/candidate_id_page.dart';
import 'package:recrutaboot/routes/candidates/candidates_page.dart';
import 'package:recrutaboot/routes/home/home_page.dart';

class AppWidget extends StatelessWidget {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
      path: '/viewCandidates',
      builder: (context, state) => const CandidatesPage(),
    ),
    GoRoute(
      path: '/candidate/:candidateId',
      builder: (context, state) => const CandidateIdPage(),
    ),
    ],
  );

  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recruta Boot',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 31, 97, 151)),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
