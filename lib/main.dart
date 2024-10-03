import 'package:bloc_training_app/core/di/dependency_injection.dart';
import 'package:bloc_training_app/features/meme/presentation/screens/meme_screen.dart';
import 'package:flutter/material.dart';

void main() {
  initLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MemeScreen(),
    );
  }
}
