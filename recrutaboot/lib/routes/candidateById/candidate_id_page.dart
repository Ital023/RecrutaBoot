import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';
import 'package:recrutaboot/components/header/drawer/custom_drawer_header.dart';
import 'package:recrutaboot/data/http/http_client.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';
import 'package:recrutaboot/routes/candidateById/stores/CandidateIdStore.dart';

class CandidateIdPage extends StatefulWidget {
  final int candidateId;  

  const CandidateIdPage({super.key, required this.candidateId});

  @override
  State<CandidateIdPage> createState() => _CandidateIdPageState();
}

class _CandidateIdPageState extends State<CandidateIdPage> {
  final Candidateidstore store =
      Candidateidstore(repository: CandidateRepository(client: HttpClient()));

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
                                  style: TextStyle(
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${item.description}",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 18,),
                                ),
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
