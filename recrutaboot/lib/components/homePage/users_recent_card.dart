import 'package:flutter/material.dart';

class UsersRecentCard extends StatefulWidget {
  const UsersRecentCard({super.key});

  @override
  State<UsersRecentCard> createState() => _UsersRecentCardState();
}

class _UsersRecentCardState extends State<UsersRecentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/113559117?v=4"),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Italo Miranda",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text("Desenvolvedor Mobile")
                  ],
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        )
        );
  }
}
