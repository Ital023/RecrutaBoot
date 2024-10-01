import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';
import 'package:recrutaboot/components/header/drawer/custom_drawer_header.dart';
import 'package:recrutaboot/data/http/http_client.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';
import 'package:recrutaboot/routes/candidateById/stores/CandidateIdStore.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateIdPage extends StatefulWidget {
  final int candidateId;

  const CandidateIdPage({super.key, required this.candidateId});

  @override
  State<CandidateIdPage> createState() => _CandidateIdPageState();
}

class _CandidateIdPageState extends State<CandidateIdPage> {
  final Candidateidstore store =
      Candidateidstore(repository: CandidateRepository(client: HttpClient()));

  final CandidateRepository repository = CandidateRepository(client: HttpClient());

  @override
  void initState() {
    super.initState();
    store.getCandidateById(widget.candidateId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      drawer: CustomDrawerHeader(),
      body: Column(children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(20),
            color: Colors.grey[200],
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                  ),
                  AnimatedBuilder(
                      animation: Listenable.merge([
                        store.isLoading,
                        store.state,
                        store.erro,
                      ]),
                      builder: (context, children) {
                        if (store.isLoading.value) {
                          return const CircularProgressIndicator();
                        }

                        if (store.state.value == null) {
                          return const Center(
                            child: Text(
                              'Nenhum candidato registrado',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        } else {
                          final item = store.state.value;
                          return Column(children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  NetworkImage(item!.githubProfile.avatarUrl),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${item.name}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${item.occupation}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${item.description}",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextButton(
                                  onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Deletar candidato'),
                                      content: const Text('Tem certeza que deseja deletar-lo?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            repository.deleteCandidate(item.id);
                                            context.go("/home");
                                          },
                                          child: const Text('Sim'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: const Column(
                                    children: [
                                      Icon(Icons.delete_forever),                    
                                      Text("Deletar",style: TextStyle(fontSize: 18),)
                                    ],
                                  ),
                                ),
                                TextButton(onPressed: () {
                                  context.go('/editCandidate/${item.id}');
                                }, child: const Column(
                                    children: [
                                      Icon(Icons.mode_edit),                    
                                      Text("Editar",style: TextStyle(fontSize: 18),)
                                    ],
                                  ))
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () async {
                                            final githubUrl =
                                                '${item.githubProfile.htmlUrl}';
                                            Uri githubUri = Uri.parse(githubUrl);
                                        
                                            if (await canLaunchUrl(githubUri)) {
                                              await launchUrl(githubUri);
                                            } else {
                                              throw 'Não foi possível abrir o link $githubUrl';
                                            }
                                          },
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                                "assets/images/githubLogo.png"),
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        GestureDetector(
                                      onTap: () async {
                                        final linkedinUrl =
                                            '${item.linkedinUrl}';
                                        Uri linkedinUri =
                                            Uri.parse(linkedinUrl);

                                        if (await canLaunchUrl(linkedinUri)) {
                                          await launchUrl(linkedinUri);
                                        } else {
                                          throw 'Não foi possível abrir o link $linkedinUrl';
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/linkedinIcon.png"),
                                      ),
                                    ),


                                      ],
                                    )
                                      
                                  ],
                                ),
                                SizedBox(height: 18),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          context.go("/home");
                                        },
                                        style: OutlinedButton.styleFrom(
                                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6)), ),
                                          side: const BorderSide(color: Color.fromARGB(255, 31, 97, 151), width: 2)
                                        ),
                                        child: Text("Voltar para home"),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: FilledButton(style: FilledButton.styleFrom(
                                        backgroundColor: item.isFavorite ? Colors.red : Color.fromARGB(255, 31, 97, 151),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6)
                                        )
                                      ),onPressed: () {
                                      store.updatedFavorite(item.id);
                                      context.go("/home");
                                      }, child: Text(item.isFavorite ? "Remover Favoritos" : "Adicionar Favoritos")
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ]);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
