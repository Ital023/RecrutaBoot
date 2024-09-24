import 'package:flutter/material.dart';
import 'package:recrutaboot/components/header/custom_drawer_header.dart';
import 'package:recrutaboot/components/homePage/banner_home_page.dart';

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
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Image.network("https://avatars.githubusercontent.com/u/113559117?v=4", height: 64, width: 64,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
