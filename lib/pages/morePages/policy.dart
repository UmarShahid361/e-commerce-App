import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        //make the back button white since the background is blue
        title: const Text(
          "Privacy Policy",
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
            padding: const EdgeInsets.all(16.0),
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
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                       "We respect your privacy and are committed to maintaining it. When you shop on our shopping store, we will ask you to input your information abd will collect Personal Information from you such as your name, e-mail address, billing address, shipping address, telephone/mobile number, product selections, credit card or other payment information and password. \n\nWe recognize your right to confidentiality and are committed to protecting your privacy. We do not furnish any identifiable information at an individual level regarding its customers to any third party. The information you give to us is held with the utmost care and security. This information is collected primarily to ensure that we are able to fulfill your requirements and to deliver you a truly personalized shopping experience. When navigating our website, personal information about you is not collected automatically or without your knowledge. \n\nWe are also bound to cooperate fully should a situation arise where we are required by law or legal process to provide information about a customer. We may share non-personal, non-individual statistical or demographic information in aggregate form with out marketing partners, advertisers or other third-parties for research and advertising purposes. In other words, we will not tell our marketing partners that you purchased a specific product, but we may tell them how many customers purchased that product. \n\nIf you consent, to notify you of products or special offers that may be of interest to you. You agree that you do not object to us contacting you for any of the above purposed whether by telephone, e-mail, or in writing and you confirm that you do not and will not consider any of the above as being a breach of any of your rights under the Telecommunications (Data Protection and Privacy) Regulations 1999. \n\nWe will not release your Personal Information to any company outside for mailing or marketing purposes.\n\nWe use 'Cookies' to keep track of your current shopping session personalize your experience and so that you may retrieve your shopping cart at any time. Cookies are tint text files which our website places on your computer's hard drive to store information about shopping session and to identify your computer. Cookies cannot harm your computer and do not contain any personal or private information, We do not hold any of your credit card information. This information is securely collected by our authorized payment processors. \n\nIn short, we always strive to respect the privacy of our customers completely. We use the information we collect on the Store to enhance your overall shopping experience. We do not sell, trade, or rent your personal information to others.\n\nIf your have any questions/comments about privacy, feel free to contact us here contact@fashionarymart.com",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
