import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  const Seat({super.key});

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 16),
        child: SizedBox(
          height: 150,
          child: TextButton(
              child: const FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  "kapkap",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
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
                    .doc('theseis');
                docasa.update({
                  'name': 'kapkap_wastaken',
                });
              }),
        ));
  }
}
