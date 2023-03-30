import 'package:flutter/material.dart';

class Thesi extends StatefulWidget {
  final String passengerName;

  const Thesi({Key? key, required this.passengerName}) : super(key: key);

  @override
  State<Thesi> createState() => _ThesiState();
}

class _ThesiState extends State<Thesi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: SizedBox(
        height: 160,
        child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Color.fromARGB(21, 0, 128, 255),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: TextButton(
            onPressed: () => {},
            child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.passengerName,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
          ),
        ),
      ),
    );
  }
}
