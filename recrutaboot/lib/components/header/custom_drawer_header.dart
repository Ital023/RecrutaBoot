import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/113559117?v=4"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Italo Miranda", style: TextStyle(fontSize: 17, color: Colors.white)),
                      Text("RI: 202314", style: TextStyle(fontSize: 15, color: Colors.white))
                    ],
                  )
                ],
              ),
              
              )
          ],
        ),
      );
  }
}