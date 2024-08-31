import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Localstoragedemo extends StatefulWidget {
  const Localstoragedemo({super.key});

  @override
  State<Localstoragedemo> createState() => _LocalstoragedemoState();
}

class _LocalstoragedemoState extends State<Localstoragedemo> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  int number = 0;

  setData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    number++;
    await preferences.setInt("counter", number);
    setState(() {});
  }

  getData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    number = preferences.getInt('counter') ?? -1 ;


    setState(() {});
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              number.toString(),
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
              style: TextStyle(),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              style: TextStyle(),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    setData();
                  });
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
