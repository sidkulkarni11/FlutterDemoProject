import 'package:flutter/material.dart';
import 'package:flutter_demo_project/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac To',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}

class TicTacToGame extends StatefulWidget {
  const TicTacToGame({super.key});

  @override
  State<TicTacToGame> createState() => _TicTacToGameState();
}

class _TicTacToGameState extends State<TicTacToGame> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

