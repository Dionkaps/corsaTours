import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  final VoidCallback callback;
  const Login({required this.callback, super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _nameController = TextEditingController();
  bool boolValue = true;
  @override
  Widget build(BuildContext context) {
    firstTimeFunc() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('firstTime', false);
    }

    void asfs() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return bool
      boolValue = prefs.getBool('firstTime') ?? false;
      print(boolValue);
    }

    void saveName(String uname) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('username', uname);
    }

    void getUsername() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      String username = prefs.getString('username').toString();
      print(username);
    }

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: height,
        child: Center(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 150),
                child: Text(
                  "CorsApp",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 135),
                  child: Text("Choose a username",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold))),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                child: SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _nameController,
                    cursorHeight: 20,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(218, 187, 222, 251),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                    style: const TextStyle(
                        fontSize: 20.0, height: 0.3, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(21, 0, 128, 255),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextButton(
                      onPressed: () {
                        if (_nameController.text.trim() == '') {
                          MotionToast.error(
                                  title: Text("Error"),
                                  description: Text("Vale username stoke"),
                                  displaySideBar: false)
                              .show(context);
                          FocusScope.of(context).unfocus();
                        } else {
                          firstTimeFunc();
                          saveName(_nameController.text.toString());
                          widget.callback();
                        }
                      },
                      child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 39, 37, 37)),
                          )),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  getUsername();
                },
                child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 39, 37, 37)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}