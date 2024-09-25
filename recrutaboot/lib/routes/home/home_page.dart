import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/app_bar_custom.dart';
import 'package:recrutaboot/components/header/drawer/custom_drawer_header.dart';
import 'package:recrutaboot/components/homePage/banner_home_page.dart';
import 'package:recrutaboot/components/homePage/users_recent_card.dart';
import 'package:recrutaboot/data/http/http_client.dart';
import 'package:recrutaboot/data/repositories/candidate_repository.dart';
import 'package:recrutaboot/routes/home/stores/candidate_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CandidateStore store =
      CandidateStore(repository: CandidateRepository(client: HttpClient()));

  @override
  void initState() {
    super.initState();
    store.getCandidates();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(),
      drawer: const CustomDrawerHeader(),
      body: Column(
        children: [
          BannerHomePage(),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(25),
            color: Colors.grey[200],
            child: Center(
              child: Column(
                children: [
                  Text("Candidatos recentes",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 12,
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
                              'Nenhum item na lista',
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
                          return Column(
                            children: [
                              for (var item in items) UsersRecentCard(candidate: item,),
                            ],
                          );

                        }
                      }),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
