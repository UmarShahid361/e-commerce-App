import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

import '../../utils/utils.dart';

class RequestCallBack extends StatefulWidget {
  const RequestCallBack({Key? key}) : super(key: key);

  @override
  State<RequestCallBack> createState() => _RequestCallBackState();
}

class _RequestCallBackState extends State<RequestCallBack> {
  final fireStore =
  FirebaseFirestore.instance.collection('CallBack Request');
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        //make the back button white since the background is blue
        title: const Text(
          "Request Callback",
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
          child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Color(0xffCCCCCC),
                  ),
                  child: const Text(
                    "Don't Worry! We will respond to your request as soon as possible.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name.';
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
                    textInputAction: TextInputAction.next,
                    controller: numberController,
                    decoration: const InputDecoration(
                      labelText: 'WhatsApp Number',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your whatsapp number.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) => val!.isEmpty || !val.contains("@")
                        ? "Enter a valid email"
                        : null,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: messageController,
                    decoration: const InputDecoration(
                      labelText: 'Message',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your message';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      loading = true;
                    });
                    if (nameController.text.isNotEmpty &&
                        numberController.text.isNotEmpty
                        && emailController.text.isNotEmpty
                        && messageController.text.isNotEmpty) {
                      fireStore.doc().set({
                        'Name': nameController.text.toString(),
                        'Number': numberController.text.toString(),
                        'Email': emailController.text.toString(),
                        'Message': messageController.text.toString(),
                      }).then((value) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage("CallBack Registered Successfully");
                      }).onError((error, stackTrace) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage(error.toString());
                      });
                    }
                    nameController.clear();
                    numberController.clear();
                    emailController.clear();
                    messageController.clear();
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
                        "Register CallBack",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Lottie.asset('assets/75663-call-center-support-lottie-animation.json', width: 280, height: 280),
              ]),
        ),
      ),
    );
  }
}
