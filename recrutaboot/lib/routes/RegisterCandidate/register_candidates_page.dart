import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recrutaboot/app_widget.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';
import 'package:recrutaboot/components/header/drawer/custom_drawer_header.dart';
import 'package:recrutaboot/data/http/http_client.dart';
import 'package:recrutaboot/data/models/candidate_model.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';

class RegisterCandidatesPage extends StatefulWidget {
  const RegisterCandidatesPage({super.key});

  @override
  State<RegisterCandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<RegisterCandidatesPage> {
  final CandidateRepository repository = CandidateRepository(client: HttpClient());

  @override
  void initState() {
    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cargoController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _githubController = TextEditingController();
  final TextEditingController _linkedinController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _cargoController.dispose();
    _descricaoController.dispose();
    _githubController.dispose();
    _linkedinController.dispose();
    super.dispose();
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
                key: _formKey,
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
                        controller: _nomeController,
                        decoration: InputDecoration(label: Text("Nome do candidato")),
                        
                        validator: (String? value) {
                          if(value == null) {
                            return "O nome do candidato nao pode ser vazio";
                          }
                          if(value.length < 2 || value.length > 21) {
                            return "O tamanho do nome do candidato e invalido";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _cargoController,
                        decoration: InputDecoration(
                          label: Text("Cargo"),
                        ),
                        validator: (String? value) {
                          if(value == null || value.length < 2) {
                            return "O cargo nao pode ser vazio";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _descricaoController,
                        decoration: InputDecoration(
                          label: Text("Descricao"),
                        ),
                        validator: (String? value) {
                          if(value == null) {
                            return "A descricao nao pode ser vazio";
                          }
                          if(value.length < 50 || value.length > 245) {
                            return "A descricao deve ser entre 50 a 245 caracteres";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _githubController,
                        decoration: InputDecoration(
                          label: Text("Usuario do Github"),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _linkedinController,
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
                          onPressed: () {
                            botaoPrincipalClicado();
                            
                          },
                          child: Text("Enviar")
                          ),
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

  botaoPrincipalClicado(){
    if(_formKey.currentState!.validate()) {
       final candidatoData = {
        'name': _nomeController.text,
        'occupation': _cargoController.text,
        'description': _descricaoController.text,
        'githubUsername': _githubController.text,
        'linkedinUrl': _linkedinController.text,
      };

      final CandidateModelCreate candidateModelCreate = CandidateModelCreate.fromMap(candidatoData);

      repository.createCandidate(candidateModelCreate);

      context.go("/home");
    }else {
      
    }
  }


}
