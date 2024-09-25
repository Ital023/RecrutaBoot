import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/custom_drawer_header.dart';
import 'package:recrutaboot/components/homePage/banner_home_page.dart';
import 'package:recrutaboot/components/homePage/users_recent_card.dart';

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
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: const Text("RecrutaBoot",
            style: TextStyle(fontSize: 25, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 31, 97, 151),
      ),
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
                  UsersRecentCard(),
                  UsersRecentCard(),
                  UsersRecentCard(),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
