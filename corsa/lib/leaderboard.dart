import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection('users').doc('names').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }

        // If the document doesn't exist, return a message
        if (snapshot.hasData && snapshot.data != null && (snapshot.data as DocumentSnapshot).exists) {
          return Text('No data found!');
        }

        // Otherwise, extract the data from the document snapshot
        Map<String, dynamic> data = (snapshot.data as DocumentSnapshot).data() as Map<String, dynamic>;
        List<String> namesList = List<String>.from(data['names']);

        // Display the names list
        return ListView.builder(
          itemCount: namesList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(namesList[index]),
            );
          },
        );
      },
    );
  }
}
