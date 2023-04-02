import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'corsa.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool boolValue = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
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

  Future<bool> boolValueMethod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('firstTime') ?? true;
    return boolValue;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: boolValueMethod(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          bool boolValue = snapshot.data!;
          if (boolValue) {
            return Login(
              callback: callback,
            );
          } else {
            return Corsa();
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
