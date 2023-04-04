import 'dart:async';
import 'package:blurry/blurry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? ekleisaBool;

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

  Future<void> ekleisa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ekleisa', true);
  }

  Future<void> getekleisa() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    ekleisaBool = prefs.getBool('ekleisa');
  }

  @override
  void initState() {
    getUsername();
    getekleisa();
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
            return Text('');
          }

          name = snapshot.data?.get('name') ?? '';
          takenseat = snapshot.data?.get('taken') ?? false;
          return Padding(
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 16),
            child: SizedBox(
              height: 150,
              child: TextButton(
                  child: FittedBox(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 22),
                    ),
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
                    print(ekleisaBool.toString());
                    if (takenseat && widget.doc_thesi != 'thesi0') {
                      MotionToast.error(
                        title: Text("Error"),
                        description: Text("Einai piasmeni vlhma"),
                        displaySideBar: false,
                      ).show(context);
                    }
                    if ((ekleisaBool == false || ekleisaBool == null)&& takenseat == false) {
                      Blurry.success(
                          title: 'Confirm',
                          description: 'Eisai sigouros?',
                          confirmButtonText: 'Confirm',
                          onConfirmButtonPressed: () {
                            ekleisa();
                            final docasa = FirebaseFirestore.instance
                                .collection('kratiseis')
                                .doc(widget.doc_thesi);
                            docasa.update({
                              'name': username,
                            });

                            docasa.update({
                              'taken': true,
                            });
                            final auksisi = FirebaseFirestore.instance
                                .collection('corsaUsers')
                                .doc(username);
                            auksisi.update({
                              'kourses': FieldValue.increment(1),
                            });
                            getekleisa();
                            Navigator.pop(context);
                            MotionToast.success(
                              title: Text("Success"),
                              description: Text("Xrwstas cafe"),
                              displaySideBar: false,
                            ).show(context);
                          }).show(context);
                    } else if (ekleisaBool == true && takenseat == false && widget.doc_thesi != 'thesi0') {
                      MotionToast.error(
                        title: Text("Error"),
                        description: Text("Exeis kleisei hdh stoke"),
                        displaySideBar: false,
                      ).show(context);
                    }
                    else if (widget.doc_thesi == 'thesi0') {
                      MotionToast.error(
                        title: Text("Error"),
                        description: Text("Tha to odigiseis esi to Corsa?"),
                        displaySideBar: false,
                      ).show(context);
                    }
                  }),
            ),
          );
        });
  }
}
