import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Progress'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bar_chart, size: 80, color: Colors.purple),
            const SizedBox(height: 16),
            const Text('Progress Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text('Coming Soon!', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
