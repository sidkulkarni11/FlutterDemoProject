import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'modal/User.dart';

class UserApiApp extends StatefulWidget {
  @override
  _UserApiAppState createState() => _UserApiAppState();
}

class _UserApiAppState extends State<UserApiApp> {
  late Future<User> user;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('User API Example')),
        body: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${snapshot.data!.name}'),
                  Text('Username: ${snapshot.data!.username}'),
                  Text('Email: ${snapshot.data!.email}'),
                  Text('Phone: ${snapshot.data!.phone}'),
                  Text('Website: ${snapshot.data!.website}'),
                  Text('Company: ${snapshot.data!.company.name}'),
                  Text('CatchPhrase: ${snapshot.data!.company.catchPhrase}'),
                  Text('Address: ${snapshot.data!.address.street}, ${snapshot.data!.address.city}'),
                ],
              );
            } else {
              return Center(child: Text('No data found'));
            }
          },
        ),
      ),
    );
  }
}
