import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WishList extends StatelessWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("WishList", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Lottie.asset('assets/67027-wishlist.json',  height: 300, width: 300, fit: BoxFit.fill,repeat: false),
        ),
      ),
    );
  }
}
