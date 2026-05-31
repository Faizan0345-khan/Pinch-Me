import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Profile'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person, size: 80, color: Colors.purple),
            const SizedBox(height: 16),
            const Text('Profile Screen', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 8),
            Text('Coming Soon!', style: TextStyle(color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }
}
