import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({super.key});

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  bool loading = false;
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final postalCodeController = TextEditingController();
  final cityController = TextEditingController();

  updateData(id, value1, value2, value3, value4, value5, value6) async {
    await FirebaseFirestore.instance
        .collection('Address Details')
        .doc(id)
        .update({
      'name': value1,
      'number': value2,
      'email': value3,
      'address': value4,
      'postalCode': value5,
      'city': value6,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Update Address Details"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("Address Details").get(),
        builder: (context, dynamic snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String name = snapshot.data!.docs[index]['name'];
                  String number = snapshot.data!.docs[index]['number'];
                  String email = snapshot.data!.docs[index]['email'];
                  String address = snapshot.data!.docs[index]['address'];
                  String postalCode = snapshot.data!.docs[index]['postalCode'];
                  String city = snapshot.data!.docs[index]['city'];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['name']),
                          onChanged: (value1) {
                            name = value1;
                          },
                          decoration: const InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['number']),
                          onChanged: (value2) {
                            number = value2;
                          },
                          decoration: const InputDecoration(
                            labelText: "Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['email']),
                          onChanged: (value2) {
                            email = value2;
                          },
                          decoration: const InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.streetAddress,
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['address']),
                          onChanged: (value2) {
                            address = value2;
                          },
                          decoration: const InputDecoration(
                            labelText: "Address",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['postalCode']),
                          onChanged: (value2) {
                            postalCode = value2;
                          },
                          decoration: const InputDecoration(
                            labelText: "Postal Code",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: TextEditingController(
                              text: snapshot.data!.docs[index]['city']),
                          onChanged: (value2) {
                            city = value2;
                          },
                          decoration: const InputDecoration(
                            labelText: "City",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            updateData(snapshot.data!.docs[index].id, name, number, email, address, postalCode, city);
                            Utils().toastMessage("Address Details Updated!");
                            nameController.clear();
                            numberController.clear();
                            emailController.clear();
                            addressController.clear();
                            postalCodeController.clear();
                            cityController.clear();
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
                                "Update Address Details",
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
