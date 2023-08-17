import 'package:flutter/material.dart';

import '../database/db_helper.dart';
import '../models/medicine.dart';

class AddEditMedicineScreen extends StatefulWidget {
  const AddEditMedicineScreen({super.key});

  @override
  State<AddEditMedicineScreen> createState() => _AddEditMedicineScreenState();
}

class _AddEditMedicineScreenState extends State<AddEditMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _dosage = '';
  String _frequency = '';
  List<String> _reminderTimes = [];
  String _notes = '';

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
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Dosage'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the dosage.';
                }
                return null;
              },
              onSaved: (value) {
                _dosage = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Frequency'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the frequency.';
                }
                return null;
              },
              onSaved: (value) {
                _frequency = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Notes'),
              onSaved: (value) {
                _notes = value!;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Validate and save the form
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            final newMedicine = Medicine(
              id: DateTime.now().toString(),
              name: _name,
              dosage: _dosage,
              frequency: _frequency,
              reminderTimes: _reminderTimes,
              notes: _notes,
            );
            await DBHelper.insert(newMedicine);
            Navigator.of(context).pop(newMedicine);
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

