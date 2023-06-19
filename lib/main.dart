import 'package:e_commerce_app/auth/signIn.dart';
import 'package:e_commerce_app/pages/SplashScreen.dart';
import 'package:e_commerce_app/pages/morePages/AddSenderDetails.dart';
import 'package:e_commerce_app/pages/morePages/bandDetails.dart';
import 'package:e_commerce_app/pages/morePages/senderDetails.dart';
import 'package:e_commerce_app/pages/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff66CC99),
          secondary:  const Color(0xff66CC99),
          background: const Color(0xffCCCCCC),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

