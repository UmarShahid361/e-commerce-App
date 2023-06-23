import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/pages/morePages/updateSenderData/UpdateAddress.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AddressCard extends StatefulWidget {
  const AddressCard(
      {super.key,
        required this.name,
        required this.number,
      required this.email,
      required this.address,
      required this.postalCode,
      required this.city});

  final String name;
  final String number;
  final String email;
  final String address;
  final String postalCode;
  final String city;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  deleteData(id) async {
    await FirebaseFirestore.instance.collection('Address Details').doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('Address Details').get(),
      builder: (context, dynamic snapshot){
        if(snapshot.hasData){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 180,
                  padding: const EdgeInsets.all(8.0),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UpdateAddress()));
                              },
                              child: const Icon(Icons.edit, size: 22,)),
                          const SizedBox(width: 10,),
                          GestureDetector(
                              onTap: () {
                                Utils().toastMessage("Details Deleted Successfully");
                                deleteData(snapshot.data!.docs[index].id);
                                setState(() {});
                              },
                              child: const Icon(Icons.delete, size: 22,)),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Name ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            widget.name,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Number ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            widget.number,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Email ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            widget.email,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Address ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            widget.address,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Postal Code ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            widget.postalCode,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "City ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            widget.city,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          );
        }
        else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
