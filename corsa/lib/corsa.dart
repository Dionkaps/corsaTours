import 'package:flutter/material.dart';
import 'seat.dart';

class Corsa extends StatefulWidget {
  const Corsa({super.key});

  @override
  State<Corsa> createState() => _CorsaState();
}

class _CorsaState extends State<Corsa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 120,right: 14,left: 14),
          child: Column(
              children: [
          Row(
            children: [
              Expanded(child: Seat()),
              Expanded(child: Seat()),
            ],
          ),
          Row(
            children: [
              Expanded(child: Seat()),
              Expanded(child: Seat()),
              Expanded(child: Seat())
            ],
          )
              ],
            ),
        ));
  }
}
