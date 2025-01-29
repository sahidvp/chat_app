import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_application/controller/auth_controller.dart';
import 'package:chat_application/view/login_screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _handleLogout(BuildContext context) {
    final authController = context.read<AuthController>();
    authController.logout().then((_) {
     
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () => _handleLogout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Center(child: Text("Welcome to Home Screen!")),
    );
  }
}
