import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiApp extends StatefulWidget {
  const ApiApp({super.key});

  @override
  State<ApiApp> createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  Map<String, dynamic>? userResponse;
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
    var person =
    await http.get(Uri.parse("https://gorest.co.in/public-api/users"));

    if (person.statusCode == 200) {
      var getDetails = jsonDecode(person.body);
      setState(() {
        userResponse = getDetails;
        isLoading = false;
      });
      // Save response to Shared Preferences
      saveToSharedPreferences(getDetails);
    } else {
      print("Failed to load data from API");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> saveToSharedPreferences(Map<String, dynamic> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userResponse', jsonEncode(data));
  }

  Future<void> loadFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonResponse = prefs.getString('userResponse');
    if (jsonResponse != null) {
      setState(() {
        userResponse = jsonDecode(jsonResponse);
        isLoading = false;
      });
    } else {
      // Handle case where there is no saved data and no internet
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
        title: Text("API Practical with Shared Preferences"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : userResponse == null
          ? Center(child: Text("No Data Available"))
          : Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: userResponse!["data"].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(userResponse!["data"][index]["name"]),
                  );
                },
              ))
        ],
      ),
    );
  }
}
