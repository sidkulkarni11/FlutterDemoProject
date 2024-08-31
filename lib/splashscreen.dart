
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late GifController _controller;


  @override
  void initState() {
    super.initState();

    _controller = GifController(vsync: this);

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: Gif(
            image: AssetImage("images/netflix.gif"),
            controller: _controller,
            autostart: Autostart.no,
            placeholder: (context) => const Text('Loading...'),
            onFetchCompleted: () {
              _controller.reset();
              _controller.forward();
            },
          ),
        ),
      ),
    );
  }
}
