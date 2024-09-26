import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';
import 'package:recrutaboot/components/homePage/users_recent_card.dart';
import 'package:recrutaboot/data/http/http_client.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';
import 'package:recrutaboot/routes/candidates/stores/CandidateViewStore.dart';

class CandidatesPage extends StatefulWidget {
  const CandidatesPage({super.key});

  @override
  State<CandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<CandidatesPage> {
  final Candidateviewstore store =
      Candidateviewstore(repository: CandidateRepository(client: HttpClient()));

  @override
  void initState() {
    super.initState();
    store.getCandidates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.grey[200],
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Meus candidatos",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 24,
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

                          if (store.state.value.isEmpty) {
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
                            final items = store.state.value.toList();
                            return Expanded(
                              child: ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return UsersRecentCard(
                                      candidate: items[index]);
                                },
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
