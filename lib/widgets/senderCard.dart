import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../pages/morePages/updateSenderData/UpdateSender.dart';
import '../utils/utils.dart';

class SenderCard extends StatelessWidget {
   SenderCard(
      {super.key, required this.senderName, required this.senderNumber});

   String senderName;
   String senderNumber;

  @override
  Widget build(BuildContext context) {

    updateData(id, value1, value2) async {
      await FirebaseFirestore.instance.collection('Sender Details').doc(id).update({
        'Sender Name': value1,
        'Sender Number': value2,
      });
    }

    deleteData(id) async {
      await FirebaseFirestore.instance
          .collection('Sender Details')
          .doc(id)
          .delete();
    }

    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('Sender Details').get(),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateSender()));
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
                                      "Sender Details Deleted Successfully");
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
                          "Sender Name: $senderName",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Sender Number: $senderNumber",
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
   // Future<void> _showDialog(BuildContext context) async {
   //   final nameController = TextEditingController();
   //   final numberController = TextEditingController();
   //   updateData(id, value1, value2) async {
   //     await FirebaseFirestore.instance
   //         .collection('Users')
   //         .doc(id)
   //         .update({
   //       'senderName': value1,
   //       'senderNumber': value2,
   //     });
   //   }
   //   return showDialog<void>(
   //     context: context,
   //     builder: (BuildContext dialogContext) {
   //       return AlertDialog(
   //         shape: RoundedRectangleBorder(
   //           borderRadius: BorderRadius.circular(20),
   //         ),
   //         title: const Text('Update Profile', style: TextStyle(fontSize: 16)),
   //         content: SingleChildScrollView(
   //             child: ListBody(
   //               children: [
   //                 TextFormField(
   //                   controller: nameController,
   //                   decoration: const InputDecoration(
   //                     labelText: 'Name',
   //                     labelStyle: TextStyle(
   //                       color: Colors.black,
   //                     ),
   //                     focusedBorder: OutlineInputBorder(
   //                       borderSide: BorderSide(
   //                         color: Color(0xffCCCCCC),
   //                       ),
   //                     ),
   //                     enabledBorder: OutlineInputBorder(
   //                       borderSide: BorderSide(
   //                         color: Color(0xff66CC99),
   //                       ),
   //                     ),
   //                   ),
   //                 ),
   //                 const SizedBox(
   //                   height: 10,
   //                 ),
   //                 TextFormField(
   //                   validator: (value) {
   //                     if (value!.isEmpty) {
   //                       return 'Please enter email';
   //                     }
   //                     return null;
   //                   },
   //                   controller: numberController,
   //                   keyboardType: TextInputType.emailAddress,
   //                   decoration: const InputDecoration(
   //                     labelText: 'Email',
   //                     labelStyle: TextStyle(
   //                       color: Colors.black,
   //                     ),
   //                     focusedBorder: OutlineInputBorder(
   //                       borderSide: BorderSide(
   //                         color: Color(0xffCCCCCC),
   //                       ),
   //                     ),
   //                     enabledBorder: OutlineInputBorder(
   //                       borderSide: BorderSide(
   //                         color: Color(0xff66CC99),
   //                       ),
   //                     ),
   //                   ),
   //                 ),
   //                 const SizedBox(
   //                   height: 10,
   //                 ),
   //               ],
   //             )
   //         ),
   //         actions: <Widget>[
   //           TextButton(
   //             child: const Text('Update', style: TextStyle(fontSize: 16)),
   //             onPressed: () {
   //               if (nameController.text.isNotEmpty ||
   //                   numberController.text.isNotEmpty) {
   //                 updateData(, nameController.text.toString(),
   //                     numberController.text.toString(),
   //                 Utils().toastMessage('Profile Updated Successfully');
   //               }
   //             },
   //           ),
   //           TextButton(
   //             child: const Text('Cancel', style: TextStyle(fontSize: 16)),
   //             onPressed: () {
   //               Navigator.of(dialogContext).pop(); // Dismiss alert dialog
   //             },
   //           ),
   //         ],
   //       );
   //     },
   //   );
   // }
}
