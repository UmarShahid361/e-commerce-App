import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../pages/morePages/updateSenderData/UpdateBank.dart';
import '../utils/utils.dart';

class BankCard extends StatelessWidget {
  const BankCard(
      {super.key, required this.bankName, required this.accountNumber});

  final String bankName;
  final String accountNumber;

  @override
  Widget build(BuildContext context) {
    deleteData(id) async {
      await FirebaseFirestore.instance
          .collection('Bank Details')
          .doc(id)
          .delete();
    }

    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('Bank Details').get(),
        builder: (context, dynamic snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 95,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset:
                              const Offset(2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateBank()));
                                },
                                child: const Icon(
                                  Icons.edit,
                                  size: 22,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                                onTap: () {
                                  deleteData(snapshot.data!.docs[index].id);
                                  Utils().toastMessage(
                                      "Details Deleted Successfully");
                                },
                                child: const Icon(
                                  Icons.delete,
                                  size: 22,
                                )),
                            const SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                        Text(
                          "Account Number: $accountNumber",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Bank Name: $bankName",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
