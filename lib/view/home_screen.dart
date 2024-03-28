import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_api_and_provider/resource/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Welcome to Home Screen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ) ,
    );
  }
}