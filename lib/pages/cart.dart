import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("My Cart", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Lottie.asset('assets/42176-empty-cart.json', height: 200, width: 200, fit: BoxFit.fill,repeat: false),
        ),
      ),
    );
  }
}
