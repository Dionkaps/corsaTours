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
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Color.fromARGB(255, 174, 221, 255),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Table(
                    border: TableBorder.symmetric(),
                    columnWidths: {
                      0: FlexColumnWidth(1),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Align(
                                alignment: Alignment.center,
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    'Staseis Corsa',
                                    style: TextStyle(
                                      fontSize: 45,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Card(
                                          elevation: 25,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text('Agios Andreas',
                                                style: TextStyle(fontSize: 30)),
                                          ),
                                        )))),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Card(
                                          elevation: 25,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text('Korinthou-Favierou',
                                                style: TextStyle(fontSize: 30)),
                                          ),
                                        )))),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Card(
                                          elevation: 25,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text('Korinthou',
                                                style: TextStyle(fontSize: 30)),
                                          ),
                                        )))),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: Card(
                                          elevation: 25,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text('Ceid',
                                                style: TextStyle(fontSize: 30)),
                                          ),
                                        )))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              child: Row(children: [
                Card(
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Color.fromARGB(255, 246, 246, 255),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('Payment method :☕')),
                )
              ]),
            )
          ]),
    );
  }
}
