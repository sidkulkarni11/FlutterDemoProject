import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = false;
  final _formKey = GlobalKey<FormState>();
  bool isSaveLogin = false;
  
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  
  setData() async{
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("username", usernameController.text);
    preferences.setString("pass", passwordController.text);
    preferences.setBool("login", true);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(),
                    labelText: 'Email or phone number',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                    fillColor: Colors.grey[800],
                    focusedBorder: InputBorder.none,

                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white), // Text color
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: obscureText,
                decoration: InputDecoration(
                    filled: true,
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                    fillColor: Colors.grey[800],
                    focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          obscureText ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },

                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.white), // Text color
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    String un = usernameController.text;
                    String pass = passwordController.text;
                    setState(() {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (un == "Sid" && pass == "Sid") {
                          setData();
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please check the fields')),
                        );
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please check the fields')),
                        );
                      }

                    });

                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      side: BorderSide(color: Colors.white, width: 2)),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
