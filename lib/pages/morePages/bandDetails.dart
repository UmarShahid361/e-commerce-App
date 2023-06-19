import 'package:e_commerce_app/widgets/bankCard.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'AddBankDetails.dart';

class BankDetails extends StatelessWidget {
  BankDetails({Key? key}) : super(key: key);

  final fireStore =
      FirebaseFirestore.instance.collection('Bank Details').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        //make the back button white since the background is blue
        title: const Text(
          "Bank Details",
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                StreamBuilder<QuerySnapshot>(
                  stream: fireStore,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BankCard(
                                accountNumber: snapshot.data.docs[index]['accountNo'],
                                bankName: snapshot.data.docs[index]['bankName'],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                        const Center(
                          child: Text(
                            "You have not added sender details yet.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){Navigator.push(context,
                              MaterialPageRoute(builder: (context) => AddBankDetails()));},
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor: const Color(0xff66CC99),
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                          child: const Text(
                            "Add Sender Details",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
