import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MedMinder')),
      body: const Center(child: Text('Home Screen Placeholder')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Will navigate to Add/Edit medicine screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
