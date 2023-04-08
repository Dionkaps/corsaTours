import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:morphing_text/morphing_text.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  static const List<String> text = [
    "Corsa Tours",
    "From your place",
    "to Ceid",
    "to Ceid and back",
    "with safety",
    "with safety and comfort",
  ];

  List<Widget> animations = [
    EvaporateMorphingText(
      texts: text,
      loopForever: true,
      onComplete: () {
        print("Completed");
      },
      textStyle: TextStyle(fontSize: 25.0),
    ),
    ScaleMorphingText(
      texts: text,
      loopForever: true,
      onComplete: () {
        print("Completed");
      },
      textStyle: TextStyle(fontSize: 30.0),
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.center,
                child: animations[index % animations.length]),
          ]),
    );
  }
}
