import 'package:flutter/material.dart';

class AddEditMedicineScreen extends StatefulWidget {
  const AddEditMedicineScreen({super.key});

  @override
  State<AddEditMedicineScreen> createState() => _AddEditMedicineScreenState();
}

class _AddEditMedicineScreenState extends State<AddEditMedicineScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add/Edit Medicine')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Medicine Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a name.';
                }
                return null;
              },
            ),
            //... Add other fields here: Dosage, Frequency, Reminder Times, Notes
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Validate and save the form
          if (_formKey.currentState!.validate()) {
            // Save medicine details to database
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
