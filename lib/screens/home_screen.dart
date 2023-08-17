import 'package:flutter/material.dart';
import '../models/medicine.dart';

class HomeScreen extends StatelessWidget {
  final List<Medicine> medicines = [];

  HomeScreen({super.key}); // This will be fetched from the database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MedMinder')),
      body: ListView.builder(
        itemCount: medicines.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(medicines[index].name),
          subtitle: Text(medicines[index].dosage),
          onTap: () {
            Navigator.of(context).pushNamed('/medicine-details', arguments: medicines[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-edit-medicine');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
