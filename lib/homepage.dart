import 'dart:ui';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool ohturn = true;
  int ohscore = 0;
  int exscore = 0;
  List<String> deisplayExloh = List.filled(9, '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scoreboard',
                  style: TextStyle(
                      fontFamily: 'Silkscreen',
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Column(
                      children: [
                        Text('Player O',
                            style: TextStyle(
                                fontFamily: 'Silkscreen',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w400)),
                        Text('$ohscore',
                            style: TextStyle(
                                fontFamily: 'Silkscreen',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Column(
                      children: [
                        Text('Player X',
                            style: TextStyle(
                                fontFamily: 'Silkscreen',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w400)),
                        Text('$exscore',
                            style: TextStyle(
                                fontFamily: 'Silkscreen',
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                    Spacer(
                      flex: 3,
                    ),
                  ],
                )
              ],
            ),
          )),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => _tapped(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                          child: Text(
                        deisplayExloh[index],
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
            child: Column(
              children: [
                Text('TIC TAC TOE',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontFamily: 'Silkscreen',
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 50),
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black54, width: 3),
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: _clearBoard,
                        child: Text(
                          'Play again ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Silkscreen',
                          ),
                        )),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohturn && deisplayExloh[index] == '') {
        deisplayExloh[index] = 'O';
      } else if (!ohturn && deisplayExloh[index] == '') {
        deisplayExloh[index] = 'X';
      }
      ohturn = !ohturn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (deisplayExloh[0] == deisplayExloh[1] &&
        deisplayExloh[0] == deisplayExloh[2] &&
        deisplayExloh[0] != '') {
      _showwinDialog(deisplayExloh[0]);
    } else if (deisplayExloh[3] == deisplayExloh[4] &&
        deisplayExloh[3] == deisplayExloh[5] &&
        deisplayExloh[3] != '') {
      _showwinDialog(deisplayExloh[3]);
    } else if (deisplayExloh[6] == deisplayExloh[7] &&
        deisplayExloh[6] == deisplayExloh[8] &&
        deisplayExloh[6] != '') {
      _showwinDialog(deisplayExloh[6]);
    } else if (deisplayExloh[0] == deisplayExloh[3] &&
        deisplayExloh[0] == deisplayExloh[6] &&
        deisplayExloh[0] != '') {
      _showwinDialog(deisplayExloh[0]);
    } else if (deisplayExloh[1] == deisplayExloh[4] &&
        deisplayExloh[1] == deisplayExloh[7] &&
        deisplayExloh[1] != '') {
      _showwinDialog(deisplayExloh[1]);
    } else if (deisplayExloh[2] == deisplayExloh[5] &&
        deisplayExloh[2] == deisplayExloh[8] &&
        deisplayExloh[2] != '') {
      _showwinDialog(deisplayExloh[2]);
    } else if (deisplayExloh[0] == deisplayExloh[8] &&
        deisplayExloh[0] == deisplayExloh[4] &&
        deisplayExloh[0] != '') {
      _showwinDialog(deisplayExloh[0]);
    } else if (deisplayExloh[2] == deisplayExloh[4] &&
        deisplayExloh[2] == deisplayExloh[6] &&
        deisplayExloh[2] != '') {
      _showwinDialog(deisplayExloh[2]);
    }
  }

  void _showwinDialog(String Winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: Text('Winner is: $Winner'));
        });
    if (Winner == 'O') {
      ohscore++;
    } else if (Winner == 'X') {
      exscore++;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        deisplayExloh[i] = '';
      }
    });
  }
}
