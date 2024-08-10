import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TIC ",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              "TAC ",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              "TOE",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.gridColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: GridView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    children: [
                      for (int i = 0; i < 9; i++) ...[
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              if (ofXO[i] == "") {
                                if (whosTurn) {
                                  ofXO[i] = "X";
                                  whosTurn = false;
                                } else {
                                  ofXO[i] = "O";
                                  whosTurn = true;
                                }
                              }
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: AppColors.xOBoxColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                ofXO[i],
                                style: TextStyle(
                                    fontSize: 70, color: AppColors.xOColor),
                              ),
                            ),
                          ),
                        )
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
