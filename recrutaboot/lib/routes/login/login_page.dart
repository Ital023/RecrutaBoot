import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recrutaboot/app_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void dispose() {
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 31, 97, 151),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter, 
               colors: [ 
                Color.fromARGB(255, 31, 97, 151),
                Colors.grey
               
               ],
               ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/images/logo.png"),
                      SizedBox(height: 20,),
                      Center(
                        child: Text("Faça login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white))
                      ),
                      SizedBox(height: 24,),

                      TextFormField(
                          controller: _usuarioController,
                          decoration: const InputDecoration(
                            hintText: "Usuario",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                      ),
                      SizedBox(height: 18,),
                      TextFormField(
                        controller: _senhaController,
                        obscureText: true,
                          decoration: const InputDecoration(
                            hintText: "Senha",
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                      ),
                      SizedBox(height: 24,),
                      FilledButton(
                          style: FilledButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 31, 97, 151),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          onPressed: () {
                            botaoPrincipalClicado();
                          },
                          child: Text("Enviar", style: TextStyle(fontSize: 20),)
                          ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

botaoPrincipalClicado(){
    if(_usuarioController.text == "root" && _senhaController.text == "root") {
      context.go("/home");
    }else {
      context.go("/home");

    }


}


}