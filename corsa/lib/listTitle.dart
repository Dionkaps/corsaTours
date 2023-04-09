import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        width: MediaQuery.of(context).size.width ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.center,
                child: ListTile(
                    title: FittedBox(
                      child: Text(
                                      'Total Rides Leaderboard',
                                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                                    ),
                    ))),
          ],
        ),
      ),
    );
  }
}
