import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: AppColors.netflixAppBarColor,
          child: Row(
            children: [
              IconButton(onPressed: (){}, icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
              Spacer(),
              Text("Netflix",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.netflixColor,
                  fontSize: 24
                ),
              ),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
