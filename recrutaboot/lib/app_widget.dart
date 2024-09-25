import 'package:flutter/material.dart';
import 'package:recrutaboot/routes/candidates/candidates_page.dart';
import 'package:recrutaboot/routes/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recruta Boot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 31, 97, 151)),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(key: UniqueKey()),
        "/viewCandidates": (context) => CandidatesPage(key: UniqueKey())
      },
      
    );
  }
}