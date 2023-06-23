import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class UpdateSender extends StatefulWidget {
  const UpdateSender({super.key});

  @override
  State<UpdateSender> createState() => _UpdateSenderState();
}

class _UpdateSenderState extends State<UpdateSender> {
  bool loading = false;
  final nameController = TextEditingController();
  final numberController = TextEditingController();

  updateData(id, value1, value2) async {
    await FirebaseFirestore.instance
        .collection('Sender Details')
        .doc(id)
        .update({
      'senderName': value1,
      'senderNumber': value2,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Update Sender Details"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("Sender Details").get(),
        builder: (context, dynamic snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String senderName = snapshot.data!.docs[index]['senderName'];
                  String senderNumber = snapshot.data!.docs[index]['senderNumber'];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['senderName']),
                          onChanged: (value1) {
                            senderName = value1;
                          },
                          decoration: const InputDecoration(
                            labelText: "Sender Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['senderNumber']),
                          onChanged: (value2) {
                            senderNumber = value2;
                          },
                          decoration: const InputDecoration(
                            labelText: "Sender Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            updateData(snapshot.data!.docs[index].id, senderName, senderNumber);
                            Utils().toastMessage("Sender Details Updated!");
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
                                      "Update Sender Details",
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
