import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';
import 'package:recrutaboot/components/header/drawer/custom_drawer_header.dart';

class RegisterCandidatesPage extends StatefulWidget {
  const RegisterCandidatesPage({super.key});

  @override
  State<RegisterCandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<RegisterCandidatesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      drawer: const CustomDrawerHeader(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        "Registrar candidato",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(label: Text("Nome do candidato")),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Cargo"),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Descricao"),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Usuario do Github"),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text("Link do Linkedin"),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FilledButton(
                          style: FilledButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 31, 97, 151),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          onPressed: () {},
                          child: Text("Entrar")),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
