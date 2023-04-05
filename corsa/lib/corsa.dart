import 'package:flutter/material.dart';
import 'seat.dart';
import 'usersData.dart';
import 'listTitle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Corsa extends StatefulWidget {
  const Corsa({super.key});

  @override
  State<Corsa> createState() => _CorsaState();
}

class _CorsaState extends State<Corsa> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 0, right: 14, left: 14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 110),
            child: Text(
              'Seat picker',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Seat(
                doc_thesi: 'thesi0',
              )),
              Expanded(
                  child: Seat(
                doc_thesi: 'thesi1',
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Seat(
                doc_thesi: 'thesi2',
              )),
              Expanded(
                  child: Seat(
                doc_thesi: 'thesi3',
              )),
              Expanded(
                  child: Seat(
                doc_thesi: 'thesi4',
              ))
            ],
          ),
        ],
      ),
    ));
  }
}
