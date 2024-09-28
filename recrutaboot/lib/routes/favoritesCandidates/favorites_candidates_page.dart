import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';
import 'package:recrutaboot/components/header/drawer/custom_drawer_header.dart';
import 'package:recrutaboot/components/homePage/users_recent_card.dart';
import 'package:recrutaboot/data/http/http_client.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';
import 'package:recrutaboot/routes/favoritesCandidates/stores/FavoriteCandidateStore.dart';

class FavoritesCandidatesPage extends StatefulWidget {
  const FavoritesCandidatesPage({super.key});

  @override
  State<FavoritesCandidatesPage> createState() => _CandidatesPageState();
}

class _CandidatesPageState extends State<FavoritesCandidatesPage> {
  final Favoritecandidatestore store =
      Favoritecandidatestore(repository: CandidateRepository(client: HttpClient()));

  @override
  void initState() {
    super.initState();
    store.getFavorites();
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
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Meus favoritos",
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
