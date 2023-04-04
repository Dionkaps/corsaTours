import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersData extends StatefulWidget {
  const UsersData({super.key});

  @override
  State<UsersData> createState() => _UsersDataState();
}

class _UsersDataState extends State<UsersData> {
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
      stream: FirebaseFirestore.instance.collection("corsaUsers").snapshots(),
      builder: (context, snapshots) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: (snapshots.data)?.docs.length ?? 0,
          itemBuilder: (context, index) {
            DocumentSnapshot documentSnapshot = (snapshots.data!).docs[index];
            return Container(
                key: Key(documentSnapshot["name"]),
                child: Column(children: [
                  Card(
                    color: Color.fromARGB(41, 33, 149, 243),
                    elevation: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: ListTile(
                                      title: Text(
                                    documentSnapshot['name'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: ListTile(
                                    title: Text(
                                        textAlign: TextAlign.center,
                                        documentSnapshot['kourses'].toString(),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]));
          },
        );
      },
    );
  }
}
