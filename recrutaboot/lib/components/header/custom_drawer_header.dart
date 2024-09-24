import 'package:flutter/material.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 31, 97, 151)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/113559117?v=4"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Italo Miranda",
                        style: TextStyle(fontSize: 17, color: Colors.white)),
                    Text("RI: 202314",
                        style: TextStyle(fontSize: 15, color: Colors.white)),
                    Container(
                      height: 10,
                    ),
                    Text("Bem vindo a RecrutaBoot",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text("Meus candidatos"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.group_add),
            title: Text("Registrar candidato"),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Sair da conta"),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
