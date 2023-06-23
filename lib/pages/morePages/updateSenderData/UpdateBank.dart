import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class UpdateBank extends StatefulWidget {
  UpdateBank({super.key});

  @override
  State<UpdateBank> createState() => _UpdateBankState();
}

class _UpdateBankState extends State<UpdateBank> {
  bool loading = false;
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  updateData(id, value1, value2) async {
    await FirebaseFirestore.instance
        .collection('Bank Details')
        .doc(id)
        .update({
      'accountNo': value1,
      'bankName': value2,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Update Bank Details"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("Bank Details").get(),
        builder: (context, dynamic snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String bankName = snapshot.data!.docs[index]['bankName'];
                  String accountNo = snapshot.data!.docs[index]['accountNo'];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['bankName']),
                          onChanged: (value1) {
                            bankName = value1;
                          },
                          decoration: const InputDecoration(
                            labelText: "Bank Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['accountNo']),
                          onChanged: (value2) {
                            accountNo = value2;
                          },
                          decoration: const InputDecoration(
                            labelText: "Account Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            updateData(snapshot.data!.docs[index].id, accountNo, bankName);
                            Utils().toastMessage("Bank Details Updated!");
                            nameController.clear();
                            numberController.clear();
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                              color: const Color(0xff66CC99),
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                            child: Center(
                              child: loading
                                  ? const CircularProgressIndicator(
                                strokeWidth: 3,
                                color: Colors.white,
                              )
                                  : const Text(
                                "Update Bank Details",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
