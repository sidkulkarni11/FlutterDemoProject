import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'modal/User.dart';

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<ApiApp> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  List<User>? userResponse;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUserDetails();
  }

  Future<void> loadUserDetails() async {
    // Check internet connection
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No internet, load from Shared Preferences
      await loadFromSharedPreferences();
    } else {
      // Internet available, fetch data from API
      await getUserDetails();
    }
  }

  Future<void> getUserDetails() async {
    var response = await http.get(Uri.parse("https://gorest.co.in/public-api/users"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<User> users = (jsonData['data'] as List).map((userJson) {
        return User.fromJson(userJson);
      }).toList();

      setState(() {
        userResponse = users;
        isLoading = false;
      });

      // Save response to Shared Preferences
      saveToSharedPreferences(jsonData['data']);
    } else {
      print("Failed to load data from API");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> saveToSharedPreferences(List<dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userResponse', jsonEncode(data));
  }

  Future<void> loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonResponse = prefs.getString('userResponse');
    if (jsonResponse != null) {
      List<dynamic> data = jsonDecode(jsonResponse);
      List<User> users = data.map((userJson) {
        return User.fromJson(userJson);
      }).toList();

      setState(() {
        userResponse = users;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print("No data in shared preferences and no internet connection.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API Practical with Shared Preferences"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : userResponse == null
          ? const Center(child: Text("No Data Available"))
          : ListView.builder(
        itemCount: userResponse!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userResponse![index].name),
            subtitle: Text(userResponse![index].email),
          );
        },
      ),
    );
  }
}
