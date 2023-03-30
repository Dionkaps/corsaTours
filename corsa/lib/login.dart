import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  final VoidCallback callback;
  const Login({required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    bool boolValue = true;
    addStringToSF() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('firstTime', false);
    }

    asfs() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return bool
      boolValue = prefs.getBool('firstTime') ?? true;
      print(boolValue);
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
                        addStringToSF();
                        callback();
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
                  asfs();
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
