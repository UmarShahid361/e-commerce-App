import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/utils.dart';

class AddSenderDetails extends StatefulWidget {
  const AddSenderDetails({super.key});

  @override
  State<AddSenderDetails> createState() => _AddSenderDetailsState();
}

class _AddSenderDetailsState extends State<AddSenderDetails> {

  final fireStore = FirebaseFirestore.instance.collection('Sender Details');
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sender Details"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Sender Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                controller: numberController,
                decoration: const InputDecoration(
                  labelText: 'Sender Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox( height: 10,),
            InkWell(
              onTap: () {
                setState(() {
                  loading = true;
                });
                if (nameController.text.isNotEmpty &&
                    numberController.text.isNotEmpty) {
                  fireStore.doc().set({
                    'senderName': nameController.text.toString(),
                    'senderNumber': numberController.text.toString(),
                  }).then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage("Sender Details added Successfully");
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(error.toString());
                  });
                }
                nameController.clear();
                numberController.clear();
              },
              child: Container(
                height: 40,
                width: 200,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(2, 2), // changes position of shadow
                    ),
                  ],
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
                    "Add Bank Details",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
