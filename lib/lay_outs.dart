import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutsPrac extends StatefulWidget {
  const LayoutsPrac({super.key});

  @override
  State<LayoutsPrac> createState() => _LayoutsPracState();
}

class _LayoutsPracState extends State<LayoutsPrac> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Layouts"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i= 0; i<70;i++) ...[
                    Container(
                      height: 70,
                      width: 70,
                      color: i%2 ==0 ? Colors.red : Colors.amber,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ]
                ],

              ),
            ),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
              ),
              children: [
                for(int i = 0; i<= 50;i++)...[
                  Container(
                    width: 150,
                    height: 150,
                    color: i%2 ==0 ? Colors.red : Colors.amber,
                  )
                ]
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for(int i= 0; i<70;i++) ...[
                    Container(
                      height: 70,
                      width: 70,
                      color: i%2 ==0 ? Colors.red : Colors.amber,
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ]
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}

