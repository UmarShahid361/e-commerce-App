import 'package:flutter/material.dart';

class MoreDisplay extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Color colorData;
  const MoreDisplay({Key? key, required this.text, required this.iconData, required this.colorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            size: 24,
            color: colorData,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
