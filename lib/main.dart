import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo_project/api_prac.dart';
import 'package:flutter_demo_project/modal/CatsDetails.dart';
import 'package:flutter_demo_project/modal/PersonDetails.dart';
import 'package:http/http.dart' as http;

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
      title: 'Api',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserApiApp(),
    );
  }
}

class ApiDisplayClass extends StatefulWidget {
  const ApiDisplayClass({super.key});

  @override
  State<ApiDisplayClass> createState() => _ApiDisplayClassState();
}

class _ApiDisplayClassState extends State<ApiDisplayClass> {
  List<CatsDetails>? catDetails;

  Future<void> getUserDetails() async {
    var response =
        await http.get(Uri.parse("https://cat-fact.herokuapp.com/facts/"));

    if (response.statusCode == 200) {
      catDetails = CatsDetails.ofCats(jsonDecode(response.body));

      setState(() {});
    } else {
      print("Failed to load data from API");
      setState(() {
        // isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: catDetails!.length, itemBuilder: (context, i) {
                  return Text(catDetails![i].text ??"N/A");
            }),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    getUserDetails();
  }
}
