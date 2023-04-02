import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Seat extends StatefulWidget {
  final String doc_thesi;
  const Seat({Key? key, required this.doc_thesi}) : super(key: key);

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  String username = '';
  String name = '';
  bool takenseat = false;

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    username = prefs.getString('username').toString();
  }

  @override
  void initState() {
    getUsername();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference kratiseis =
        FirebaseFirestore.instance.collection('kratiseis');
    return StreamBuilder<DocumentSnapshot>(
        stream: kratiseis.doc(widget.doc_thesi).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          name = snapshot.data?.get('name') ?? '';
          takenseat = snapshot.data?.get('taken') ?? false;
          return Padding(
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 16),
            child: SizedBox(
              height: 150,
              child: TextButton(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 22),
                  ),
                  style: ButtonStyle(
                      backgroundColor: takenseat
                          ? MaterialStateProperty.all<Color>(
                              Color.fromARGB(55, 90, 105, 123))
                          : MaterialStateProperty.all<Color>(
                              Color.fromARGB(50, 33, 149, 243)),
                      // You can add other styles like padding, border radius etc. here
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  onPressed: () {
                    final docasa = FirebaseFirestore.instance
                        .collection('kratiseis')
                        .doc(widget.doc_thesi);
                    docasa.update({
                      'name': username,
                    });

                    docasa.update({
                      'taken': true,
                    });
                  }),
            ),
          );
        });
  }
}
