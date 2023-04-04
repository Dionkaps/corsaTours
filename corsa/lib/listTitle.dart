import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: ListTile(
                        title: Text(
                     'Username',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ))),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: ListTile(
                      title: Text(
                          textAlign: TextAlign.center,
                          'Total Rides',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
