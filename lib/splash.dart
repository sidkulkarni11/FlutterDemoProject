import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/lay_outs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LayoutsPrac()));
          }, child: Text("Push")),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LayoutsPrac()));
          }, child: Text("Pop")),
          ElevatedButton(onPressed: (){
            Navigator.pop(context, MaterialPageRoute(builder: (context)=>LayoutsPrac()));
          }, child: Text("PushReplacement"))
        ],
      ),
    );
  }
}
