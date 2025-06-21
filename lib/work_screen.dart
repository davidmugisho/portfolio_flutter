import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Work')),
      body: const Center(
        child: Text('Here is my work!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
