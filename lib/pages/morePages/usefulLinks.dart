import 'package:e_commerce_app/widgets/moreDisplay.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Links extends StatelessWidget {
  const Links({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        //make the back button white since the background is blue
        title: const Text(
          "Useful Links",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Container(
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
                child: const MoreDisplay(
                  text: "Disclaimer",
                  iconData: FontAwesomeIcons.diceOne,
                  colorData: Color(0xffFF6600),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
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
                child: const MoreDisplay(
                  text: "FAQs",
                  iconData: FontAwesomeIcons.diceTwo,
                  colorData: Color(0xffFF6600),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
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
                child: const MoreDisplay(
                  text: "Shipping Policy",
                  iconData: FontAwesomeIcons.diceThree,
                  colorData: Color(0xffFF6600),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
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
                child: const MoreDisplay(
                  text: "Steps to Order",
                  iconData: FontAwesomeIcons.diceFour,
                  colorData: Color(0xffFF6600),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
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
                child: const MoreDisplay(
                  text: "Refund Policy",
                  iconData: FontAwesomeIcons.diceFive,
                  colorData: Color(0xffFF6600),
                ),
              ),
              const SizedBox(height: 10,),
              Container(
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
                child: const MoreDisplay(
                  text: "Terms & Conditions",
                  iconData: FontAwesomeIcons.diceSix,
                  colorData: Color(0xffFF6600),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
