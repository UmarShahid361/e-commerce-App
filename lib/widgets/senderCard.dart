import 'package:flutter/material.dart';

class SenderCard extends StatelessWidget {
  const SenderCard(
      {super.key,
        required this.senderName,
        required this.senderNumber});

  final String senderName;
  final String senderNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: 95,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 3,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.edit, size: 22,)),
                const SizedBox(width: 10,),
                GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.delete, size: 22,)),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
            Text(
              "Sender Name: $senderName",
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            Text(
              "Sender Number: $senderNumber",
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        ));
  }
}
