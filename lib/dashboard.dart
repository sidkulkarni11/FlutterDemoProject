import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List ofXO = List.generate(9, (index) => "");
  bool whosTurn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          ),
          children: [
            for(int i = 0; i < 9; i++)...[
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (ofXO[i] == "")
                      if (whosTurn) {
                        ofXO[i] = "X";
                        whosTurn = false;
                      }
                      else {
                        ofXO[i] = "0";
                        whosTurn = true;
                      }
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.amber,
                    child: Text(
                      ofXO[i],
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
