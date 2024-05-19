import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/constants.dart';
import 'package:tictactoe/widgets/userCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int turn = 1;
  int move = 0;
  int moveCount = 0;
  bool isFinish = false;
  Color winner = Colors.white;
  List moveList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "TIC TAC TOE",
          style: TextStyle(color: black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  turn = 1;
                  move = 0;
                  moveCount = 0;
                  isFinish = false;
                  winner = Colors.white;
                  moveList = [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ];
                });
              },
              icon: Icon(
                Icons.refresh_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: isFinish
          ? gameResult()
          : SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      userCard(
                        userName: "User 1",
                        path: "x",
                        color: red,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      userCard(
                        userName: "User 2",
                        path: "o",
                        color: orange,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ticTacToeTable()
                ],
              ),
            ),
    );
  }

  Center gameResult() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: winner,
                )),
            winner == red
                ? Positioned(
              left: 40,
                  top: 40,
                  child: Image(
                      image: AssetImage("assets/x.png"),
                      height: 120,
                      width: 120,
                    ),
                )
                : Positioned(
              left: 40,
              top: 40,
                  child: Image(
                      image: AssetImage("assets/o.png"),
                      height: 120,
                      width: 120,
                    ),
                ),
          ]),
          SizedBox(
            height: 20,
          ),
          Text("Winner User ${(moveCount % 2) == 0 ? 2 : 1}")
        ],
      ),
    );
  }

  Container ticTacToeTable() {
    return Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: lightPrimary),
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (turn == 1) {
                  print(index);
                  setState(() {
                    moveList[index] = red;
                    turn = 2;
                    moveCount++;
                  });
                } else if (turn == 2) {
                  print(index);
                  setState(() {
                    moveList[index] = orange;
                    turn = 1;
                    moveCount++;
                  });
                }
                if (moveCount > 4) {
                  setState(() {
                    isFinish = checkGame();
                  });
                }
              },
              child: Stack(children: [
                Container(
                    decoration: BoxDecoration(
                  color: moveList[index],
                )),
                moveList[index] == red
                    ? Center(
                        child: Image(
                        image: AssetImage("assets/x.png"),
                        height: 100,
                        width: 100,
                      ))
                    : Center(
                        child: Image(
                        image: AssetImage("assets/o.png"),
                        height: 100,
                        width: 100,
                      )),
              ]),
            );
          },
        ));
  }

  bool checkGame() {
    if (moveList[0] == moveList[1] && moveList[0] == moveList[2]) {
      if (moveList[0] != Colors.white) {
        setState(() {
          winner = moveList[0];
        });
        return true;
      }
      ;
    }
    ;
    if (moveList[0] == moveList[4] && moveList[0] == moveList[8]) {
      if (moveList[0] != Colors.white) {
        setState(() {
          winner = moveList[0];
        });
        return true;
      }
      ;
    }
    ;
    if (moveList[0] == moveList[3] && moveList[0] == moveList[6]) {
      if (moveList[0] != Colors.white) {
        setState(() {
          winner = moveList[0];
        });
        return true;
      }
      ;
    }
    ;
    if (moveList[1] == moveList[4] && moveList[1] == moveList[7]) {
      if (moveList[1] != Colors.white) {
        setState(() {
          winner = moveList[1];
        });
        return true;
      }
      ;
    }
    ;
    if (moveList[2] == moveList[5] && moveList[2] == moveList[8]) {
      if (moveList[2] != Colors.white) {
        setState(() {
          winner = moveList[2];
        });
        return true;
      }
      ;
    }
    ;
    if (moveList[3] == moveList[4] && moveList[3] == moveList[5]) {
      if (moveList[3] != Colors.white) {
        setState(() {
          winner = moveList[3];
        });
        return true;
      }
      ;
    }
    ;
    if (moveList[6] == moveList[7] && moveList[6] == moveList[8]) {
      if (moveList[6] != Colors.white) {
        setState(() {
          winner = moveList[6];
        });
        return true;
      }
      ;
    }
    ;
    if (moveList[2] == moveList[4] && moveList[2] == moveList[6]) {
      if (moveList[2] != Colors.white) {
        setState(() {
          winner = moveList[2];
        });
        return true;
      }
      ;
    }
    ;
    return false;
  }
}
