import 'package:flutter/material.dart';

class Addresses extends StatelessWidget {
  const Addresses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        //make the back button white since the background is blue
        title: const Text(
          "Addresses",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
              children: [
                Text(
                  "Addresses",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}