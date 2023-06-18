import 'package:flutter/material.dart';

class AddBankDetails extends StatelessWidget {
  const AddBankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Bank Details'),
      ),
      body: const Center(
        child: Text('Add Bank Details'),
      ),
    );
  }
}
