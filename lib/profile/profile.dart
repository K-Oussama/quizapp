import 'package:flutter/material.dart';
import 'package:quizapp/services/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ElevatedButton(
        onPressed: () async{
          // Add logout logic here
          await AuthService().logout();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        },
        child: const Text('Logout'),
      ),
    );
  }
}