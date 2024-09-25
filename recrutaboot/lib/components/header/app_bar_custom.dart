import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget{
  const AppBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        title: const Text("RecrutaBoot",
            style: TextStyle(fontSize: 25, color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 31, 97, 151),
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}