import 'package:e_commerce_app/pages/morePages/aboutUs.dart';
import 'package:e_commerce_app/pages/morePages/bandDetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce_app/pages/morePages/policy.dart';
import 'package:e_commerce_app/pages/morePages/requestCallback.dart';
import 'package:e_commerce_app/pages/morePages/senderDetails.dart';
import 'package:share_plus/share_plus.dart';
import 'package:e_commerce_app/pages/morePages/usefulLinks.dart';
import 'package:e_commerce_app/pages/morePages/yourAddress.dart';
import 'package:e_commerce_app/widgets/moreDisplay.dart';
import 'package:e_commerce_app/widgets/simpleLine.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:store_redirect/store_redirect.dart';

import '../auth/signIn.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Uri phoneNumber = Uri.parse('tel:+92 3114749583');
    final Uri whatsappNumber = Uri.parse('https://wa.me/+923114749583');
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(2, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          TextButton(
                              onPressed: () async {
                                launchUrl(whatsappNumber,
                                    mode: LaunchMode.externalApplication);
                              },
                              child: const Icon(
                                FontAwesomeIcons.whatsapp,
                                size: 30,
                                color: Colors.green,
                              )),
                          const Text("Whatsapp"),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () async {
                                launchUrl(phoneNumber);
                              },
                              child: const Icon(
                                Icons.phone_enabled_sharp,
                                size: 30,
                                color: Colors.green,
                              )),
                          const Text("Phone Call"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: 450,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BankDetails()));
                          },
                          child: const MoreDisplay(
                              text: "Bank Details",
                              iconData: Icons.account_balance_rounded, colorData: Colors.black,)),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SenderDetails()));
                        },
                        child: const MoreDisplay(
                            text: "Sender Details", iconData: Icons.person, colorData: Colors.black,),
                      ),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Addresses()));
                          },
                          child: const MoreDisplay(
                              text: "Your Addresses",
                              iconData: Icons.location_pin, colorData: Colors.black,)),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RequestCallBack()));
                        },
                        child: const MoreDisplay(
                            text: "Request a Call back",
                            iconData: Icons.headset_mic, colorData: Colors.black,),
                      ),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Links()));
                          },
                          child: const MoreDisplay(
                              text: "Useful Links",
                              iconData: Icons.link_rounded, colorData: Colors.black,)),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                        onTap: () {
                          Share.share('com.example.e_commerce_app');
                        },
                        child: const MoreDisplay(
                            text: "Share App", iconData: FontAwesomeIcons.share, colorData: Colors.black,),
                      ),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                          onTap: () {
                            StoreRedirect.redirect(
                                androidAppId: "com.shop.fashionarymart",);
                          },
                          child: const MoreDisplay(
                              text: "Rate us on google play",
                              iconData: FontAwesomeIcons.googlePlay, colorData: Colors.black,)),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
                        },
                        child: const MoreDisplay(
                            text: "Privacy Policy",
                            iconData: FontAwesomeIcons.flask, colorData: Colors.black,),
                      ),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUs()));
                        },
                        child: const MoreDisplay(
                            text: "About Us",
                            iconData: FontAwesomeIcons.thumbsUp,
                        colorData: Colors.black,),
                      ),
                      CustomLine(
                          length: MediaQuery.of(context).size.width * 0.80),
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => const SignIn()));
                        },
                        child: const MoreDisplay(
                            text: "Logout", iconData: FontAwesomeIcons.arrowRightFromBracket, colorData: Colors.black,),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
