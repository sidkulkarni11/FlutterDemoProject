import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List ofXO = List.generate(9, (index) => "");
  bool whosTurn = true;
  bool isDisabled = false; // Set this to true to disable the container

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
            IconButton(
                onPressed: () {
                  ofXO.clear();
                  ofXO = List.generate(9, (index) => "");
                  whosTurn = true;
                  isDisabled = false;
                  setState(() {});
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.red,
                  size: 35,
                ))
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
                  child: IgnorePointer(
                    ignoring: isDisabled,
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

                                check(ofXO);
                                setState(() {});
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.xOBoxColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  ofXO[i],
                                  style: GoogleFonts.coiny(
                                      fontSize: 70, color: AppColors.xOColor
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
            ),
          ],
        ),
      ),
    );
  }

  void check(List<dynamic> listOFXO) {
    if (checkTicTacToeCondition(0, 1, 2, listOFXO)) {
      showToast(playerwon());
      print("*******" + playerwon());
    } else if (checkTicTacToeCondition(3, 4, 5, listOFXO)) {
      showToast(playerwon());
      print("*******" + playerwon());
    } else if (checkTicTacToeCondition(6, 7, 8, listOFXO)) {
      showToast(playerwon());
      print("*******" + playerwon());
    } else if (checkTicTacToeCondition(0, 4, 8, listOFXO)) {
      showToast(playerwon());
      print("*******" + playerwon());
    } else if (checkTicTacToeCondition(2, 4, 6, listOFXO)) {
      showToast(playerwon());
      print("*******" + playerwon());
    } else if (checkTicTacToeCondition(0, 3, 6, listOFXO)) {
      showToast(playerwon());
      print("*******" + playerwon());
    } else if (checkTicTacToeCondition(1, 4, 7, listOFXO)) {
      showToast(playerwon());
      print("*******" + playerwon());
    } else if (checkTicTacToeCondition(2, 5, 8, listOFXO)) {
      showToast(playerwon());
      print("*******" + playerwon());
    } else if (listOFXO.every((element) => element.isNotEmpty)) {
      showToast(playerwon());
      print("*******" + "draw");
    }
  }

  String playerwon() {
    if (!whosTurn) return "Player 1 wins";
    return "Player 2 wins";
  }

  bool checkTicTacToeCondition(int a, int b, int c, List<dynamic> listOFXO) {
    if (listOFXO[a] != "" && listOFXO[b] != "" && listOFXO[c] != "") {
      if ((listOFXO[a] == listOFXO[b]) && listOFXO[b] == listOFXO[c]) {
        return true;
      }
      return false;
    }
    return false;
  }

  void showToast(String message) {
    isDisabled = true;
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 18.0);
  }
}
