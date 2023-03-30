import 'package:flutter/material.dart';
import 'thesi.dart';

class Corsa extends StatefulWidget {
  const Corsa({super.key});

  @override
  State<Corsa> createState() => _CorsaState();
}

class _CorsaState extends State<Corsa> {
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
                  children: const <Widget>[
                    Expanded(
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
                        child: Thesi(
                      passengerName: 'kapkap',
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                        child: Thesi(
                      passengerName: 'Valia',
                    )),
                    Expanded(
                        child: Thesi(
                      passengerName: 'Thomas',
                    )),
                    Expanded(
                        child: Thesi(
                      passengerName: 'Mitsos',
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
