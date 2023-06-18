import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "My Orders",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text("No Orders Yet"),
      ),
    );
  }
}
