import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:blurry/blurry.dart';

class Corsa extends StatefulWidget {
  const Corsa({super.key});

  @override
  State<Corsa> createState() => _CorsaState();
}

class _CorsaState extends State<Corsa> {
  String name = 'kapkap';
  String seatName1 = '1';
  String seatName2 = '2';
  String seatName3 = '3';
  String seatName4 = '4';

  bool _exeiKleisei = false;

  bool _isButtonDisabled3 = false;

  Color _buttonColor3 = Color.fromARGB(21, 0, 128, 255);
  Color _buttonText3 = Colors.blue;

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', true);
  }

  String onoma = '';

  void getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String username = prefs.getString('username').toString();
    onoma = username;
  }

  void asfs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('firstTime') ?? false;
    print(boolValue);
  }

  void ekleise() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('exeiKleisei', true);
  }

  void exeiKleiseiThesi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool('exeiKleisei') ?? false;
    _exeiKleisei = boolValue;
  }

  void callback() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUsername();
    exeiKleiseiThesi();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          toolbarHeight: 60,
          title: const Text("Nai poios einai"),
          backgroundColor: const Color.fromARGB(255, 41, 139, 219),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15),
            ),
          ]),
      body: SizedBox(
        height: 0.5 * height,
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 45, bottom: 23, left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    const Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                        height: 160,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(21, 0, 128, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                            onPressed: null,
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  'Filaraki😅',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                        height: 160,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(21, 0, 128, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                            onPressed: () {},
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  seatName1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                        height: 160,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(21, 0, 128, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                            onPressed: () {
                              addStringToSF();
                              getUsername();
                              setState(() {
                                seatName2 = name;
                              });
                            },
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  seatName2,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                        height: 160,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: _buttonColor3,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                            onPressed: () {
                              _isButtonDisabled3 || _exeiKleisei
                                  ? null
                                  : Blurry.info(
                                      popupHeight: 200,
                                      title: 'Confirm',
                                      description: "You sure?",
                                      confirmButtonText: 'Confirm',
                                      onConfirmButtonPressed: () {
                                        Navigator.pop(context);
                                        setState(() {
                                          _isButtonDisabled3 = true;
                                          _buttonColor3 = Colors.blue;
                                          _buttonText3 = Colors.black;
                                          seatName3 = onoma;
                                        });
                                      },
                                      barrierColor:
                                          Colors.white.withOpacity(0.7),
                                      dismissable: false,
                                    ).show(context);
                            },
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  seatName3,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: _buttonText3),
                                )),
                          ),
                        ),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: SizedBox(
                        height: 160,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(21, 0, 128, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                            onPressed: () {},
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                  seatName4,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
