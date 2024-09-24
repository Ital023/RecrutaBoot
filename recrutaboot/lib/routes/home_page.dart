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
        backgroundColor: Colors.green,
      ),
      drawer: const CustomDrawerHeader(),
      body: Row(
        children: [
          BannerHomePage()
        
        ],
      ),
    );
  }
}
