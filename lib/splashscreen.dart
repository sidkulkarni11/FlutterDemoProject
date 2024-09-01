import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late GifController _controller;

  getData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var islogin = preferences.getBool("login") ?? false;

    Future.delayed(Duration(seconds: 3), () {
      if (islogin) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    _controller = GifController(vsync: this);
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
