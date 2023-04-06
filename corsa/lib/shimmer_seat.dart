import 'package:flutter/material.dart';

class ShimmerSeat extends StatelessWidget {
  const ShimmerSeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 16),
      child: Container(
        width: 100,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
