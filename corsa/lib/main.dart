import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corsa/usersData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'corsa.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool boolValue = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
// Retrieve the current date and time
  DateTime now = DateTime.now();
// Helper function to convert an integer to a two-digit string
  String _twoDigitString(int number) {
    return number.toString().padLeft(2, '0');
  }

  // Store the date in shared preferences
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('date1',
      '${now.year}-${_twoDigitString(now.month)}-${_twoDigitString(now.day)}');

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
  var currentIndex = 0;
  List<IconData> listOfIcons = [
    Icons.airplane_ticket,
    Icons.leaderboard,
    Icons.star_rounded,
    Icons.settings_rounded,
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Corsa(),
    UsersData(),
    Text(
      'Index 2: Premium',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      'Index 3: Settings',
      style: TextStyle(fontSize: 30),
    ),
  ];
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
    Size size = MediaQuery.of(context).size;
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
            return Scaffold(
                body: Center(
                  child: _widgetOptions.elementAt(currentIndex),
                ),
                bottomNavigationBar: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: size.width * .155,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 40,
                        offset: const Offset(0, 10),
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * .024),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(
                          () {
                            currentIndex = index;
                          },
                        );
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(
                              bottom:
                                  index == currentIndex ? 0 : size.width * .029,
                              right: size.width * .0422,
                              left: size.width * .0422,
                            ),
                            width: size.width * .128,
                            height:
                                index == currentIndex ? size.width * .014 : 0,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: size.width * .076,
                            color: index == currentIndex
                                ? Colors.blueAccent
                                : Colors.black38,
                          ),
                          SizedBox(height: size.width * .03),
                        ],
                      ),
                    ),
                  ),
                ));
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
