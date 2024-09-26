import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';

class CandidateIdPage extends StatefulWidget {
  const CandidateIdPage({super.key});

  @override
  State<CandidateIdPage> createState() => _CandidateIdPageState();
}

class _CandidateIdPageState extends State<CandidateIdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Column(
        children: [
          Text("Teste")
        ],
      ),
    );
  }
}