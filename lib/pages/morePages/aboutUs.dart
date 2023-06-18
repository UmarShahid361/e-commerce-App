import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        //make the back button white since the background is blue
        title: const Text(
          "About Us",
          style: TextStyle(
            fontSize: 18,
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
            child: Container(
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
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Fashionary Mart is a leading one stop online wholesale & retail fabric store for Women. We focus on bringing you a wide range of dress materials and now you can buy them at your door step from our online store at an affordable price. Our goal is to satisfy our customer by providing high quality textile products at a reasonable price. We have all types of sarees such as Designer Sarees, Party wear Sarees, etc. You can also find Kurtis, Lehenga, Salwar Kameez, Patiala Salwar, Palazzo, Western Tops, Leggings, Dress materials, kids wear and many more. We update our Android Application and Website daily with the latest designs.",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
