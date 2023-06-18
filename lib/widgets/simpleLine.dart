import 'package:flutter/material.dart';

class CustomLine extends StatelessWidget {
  final double length;
  const CustomLine({Key? key, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: length,
      height: 1,
      color: Colors.grey,
    );
  }
}
