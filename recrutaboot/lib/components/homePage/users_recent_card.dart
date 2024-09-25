import 'package:flutter/material.dart';
import 'package:recrutaboot/data/models/candidate_model.dart';

class UsersRecentCard extends StatefulWidget {
  final CandidateModel candidate;

  const UsersRecentCard({super.key, required this.candidate});
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
                  backgroundImage: NetworkImage(widget.candidate.githubProfile.avatarUrl),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.candidate.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(widget.candidate.description, style: TextStyle(fontSize: 15),)
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
