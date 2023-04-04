import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  String username = '';
  final db = FirebaseFirestore.instance;

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    username = prefs.getString('username').toString();
  }

  void initState() {
    getUsername();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("corsaUsers")
              .snapshots(),
          builder: (context, snapshots) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: (snapshots.data)?.docs.length ?? 0,
              itemBuilder: (context, index) {
                DocumentSnapshot documentSnapshot =
                    (snapshots.data!).docs[index];
                return Container(
                    key: Key(documentSnapshot["name"]),
                    child: Card(
                      elevation: 0,
                      margin: const EdgeInsets.all(5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(documentSnapshot["name"] + documentSnapshot["kourses"].toString()),
                      ),
                    ));
              },
            );
          },
        );
  }
}
