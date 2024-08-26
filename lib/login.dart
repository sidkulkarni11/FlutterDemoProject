import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height/2,
                width: double.infinity,
                child: Image.asset('assets/oracle.jpeg',
                fit: BoxFit.cover,
                )),
            TextField(
              
            )
          ],
        ),
      ),
    );
  }
}

