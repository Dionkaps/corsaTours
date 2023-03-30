import 'package:flutter/material.dart';
import 'corsa.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool boolValue = true;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStatefulWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  void callback() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool

    setState(() {
      boolValue = prefs.getBool('firstTime') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (boolValue) {
      return Login(
        callback: callback,
      );
    } else {
      return Corsa();
    }
  }
}
