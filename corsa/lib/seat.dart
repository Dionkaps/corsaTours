import 'dart:async';
import 'dart:io';
import 'package:blurry/blurry.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
  String date1 = '';
  String date2 = '';
  int comparison = 0;
  Timer? _timer;
  // Retrieve the current date and time
  DateTime now = DateTime.now();
// Helper function to convert an integer to a two-digit string
  String _twoDigitString(int number) {
    return number.toString().padLeft(2, '0');
  }

  Future<void> ananewsi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ekleisa', false);
  }

  void setDate2() async {
    // Retrieve the current date and time
    DateTime now = DateTime.now();
    // Helper function to convert an integer to a two-digit string
    String _twoDigitString(int number) {
      return number.toString().padLeft(2, '0');
    }

    // Store the date in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('date2',
        '${now.year}-${_twoDigitString(now.month)}-${_twoDigitString(now.day)}');
  }

  void getDates() async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    //Return String
    date1 = prefs1.getString('date1').toString();
    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    //Return String
    date2 = prefs2.getString('date2').toString();
  }

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

  void simera() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('date1',
        '${now.year}-${_twoDigitString(now.month)}-${_twoDigitString(now.day)}');
  }

  @override
  void initState() {
    simera();
    getUsername();
    _timer = Timer.periodic(Duration(milliseconds: 300), (timer) async{
      await getekleisa();
      getDates();
      comparison = date1.compareTo(date2);
      if (comparison < 0) {
        print('Ton ipiame');
      } else if (comparison > 0) {
        ananewsi();
        setDate2();
        print(date1);
        print(date2 + '\n');
      } else {}
    });
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
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 5, right: 5, bottom: 16),
                child: SizedBox(
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            );
          } else {
            name = snapshot.data?.get('name') ?? '';
            takenseat = snapshot.data?.get('taken') ?? false;
            return Padding(
              padding: EdgeInsets.only(top: 16, left: 5, right: 5, bottom: 16),
              child: SizedBox(
                height: 150,
                child: TextButton(
                    child: FittedBox(
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 22, color: Colors.black87),
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: takenseat
                            ? MaterialStateProperty.all<Color>(
                                Color(0xFFD7DBDF))
                            : MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 105, 175, 233)),
                        // You can add other styles like padding, border radius etc. here
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        )),
                    onPressed: () async {
                      try {
                        final result =
                            await InternetAddress.lookup('example.com');
                        if (result.isNotEmpty &&
                            result[0].rawAddress.isNotEmpty) {
                          print(ekleisaBool.toString());
                          if (takenseat && widget.doc_thesi != 'thesi0') {
                            showTopSnackBar(
                              displayDuration: Duration(milliseconds: 800),
                              Overlay.of(context),
                              CustomSnackBar.error(
                                message: "Einai piasmenh vlhma",
                              ),
                            );
                          }
                          if ((ekleisaBool == false || ekleisaBool == null) &&
                              takenseat == false) {
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
                                  showTopSnackBar(
                                    displayDuration:
                                        Duration(milliseconds: 800),
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      message: "Success Xrwstas cafe",
                                    ),
                                  );
                                }).show(context);
                          } else if (ekleisaBool == true &&
                              takenseat == false &&
                              widget.doc_thesi != 'thesi0') {
                            showTopSnackBar(
                              displayDuration: Duration(milliseconds: 800),
                              Overlay.of(context),
                              CustomSnackBar.error(
                                message: "Exeis idi kleisei stoke",
                              ),
                            );
                          } else if (widget.doc_thesi == 'thesi0') {
                            showTopSnackBar(
                              displayDuration: Duration(milliseconds: 800),
                              Overlay.of(context),
                              CustomSnackBar.error(
                                message: "Tha to odigiseis esi to Corsa?",
                              ),
                            );
                          }
                        }
                      } on SocketException catch (_) {
                        showTopSnackBar(
                          displayDuration: Duration(milliseconds: 1500),
                          Overlay.of(context),
                          CustomSnackBar.error(
                            message:
                                "Me peristeri tha epikoinisoume me ton server? Anoikse Wifi h Data",
                          ),
                        );
                      }
                    }),
              ),
            );
          }
        });
  }
}
