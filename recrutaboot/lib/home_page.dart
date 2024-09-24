import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/custom_drawer_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RecrutaBoot", style: TextStyle(fontSize: 25, color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      drawer: CustomDrawerHeader(),
      body: Container(
        child: Text("Teste"),
      ),
    );
  }
}