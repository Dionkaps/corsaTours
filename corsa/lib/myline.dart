import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class MyLine extends StatelessWidget {
  const MyLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 10, top: 20),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Start '),
                  TextSpan(
                      text: '10:30',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35.0)),
                ],
              ),
            )),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: DottedLine(
              direction: Axis.vertical,
              lineLength: double.infinity,
              lineThickness: 10.0,
              dashLength: 15.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 8.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 15, top: 10),
            child: FractionallySizedBox(
              widthFactor: 0.14,
              child: Image(
                image: AssetImage('assets/traffic_light.png'),
                fit: BoxFit.contain,
              ),
            )),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: DottedLine(
              direction: Axis.vertical,
              lineLength: double.infinity,
              lineThickness: 10.0,
              dashLength: 15.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 8.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 15, top: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Korinthou '),
                  TextSpan(
                      text: '10:45',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35.0)),
                ],
              ),
            )),
            Expanded(
          child: Align(
            alignment: Alignment.center,
            child: DottedLine(
              direction: Axis.vertical,
              lineLength: double.infinity,
              lineThickness: 10.0,
              dashLength: 15.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 8.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 15, top: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: 'Korinthou-Zavlani '),
                  TextSpan(
                      text: '10:50',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 35.0)),
                ],
              ),
            )),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: DottedLine(
              direction: Axis.vertical,
              lineLength: double.infinity,
              lineThickness: 10.0,
              dashLength: 15.0,
              dashColor: Colors.black,
              dashRadius: 0.0,
              dashGapLength: 8.0,
              dashGapColor: Colors.transparent,
              dashGapRadius: 0.0,
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 15, top: 10),
            child: FractionallySizedBox(
              widthFactor: 0.3,
              child: Image(
                image: AssetImage('assets/university.png'),
                fit: BoxFit.contain,
              ),
            )),
      ],
    );
  }
}
