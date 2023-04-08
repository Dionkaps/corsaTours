import 'package:flutter/material.dart';
import 'seat.dart';

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
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
         Padding(
          padding: EdgeInsets.only(left: 30, top: 50, bottom: 50),
           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 0),
                  child: FittedBox(
                    child: Text(
                      'Select Your Seat',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 0, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Card(
                                color: Color(0xFF69AFE9),
                              ),
                            ),
                            Text('Available'),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.only(top: 0, left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Card(
                                color: Color(0xFFD7DBDF),
                              ),
                            ),
                            Text('Filled'),
                          ],
                        )),
                  ],
                ),
              )
            ]),
         ),
        
        Padding(
          padding: const EdgeInsets.only(bottom: 50, top: 0),
          child: Card(
            elevation: 25,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Color.fromARGB(255, 250, 250, 255),
            child: Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
            ),
          ),
        ),
      ]),
    );
  }
}
