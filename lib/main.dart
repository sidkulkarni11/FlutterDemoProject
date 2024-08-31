import 'package:flutter/material.dart';
import 'package:flutter_demo_project/dashboard.dart';
import 'package:flutter_demo_project/login.dart';
import 'package:flutter_demo_project/splashscreen.dart';

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
      title: 'Movie App',
      theme: ThemeData(
        brightness: Brightness.dark, // Use dark theme settings
        scaffoldBackgroundColor: Colors.black, // Sets the background color for all scaffolds
        canvasColor: Colors.black, // Background color for Material widgets like Drawer, etc.
        cardColor: Colors.black, // Background color for Card widgets
        // Define additional colors if needed
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => Dashboard(),
        '/login': (context) => LoginScreen(),
      },
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

