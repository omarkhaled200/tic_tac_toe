import 'package:flutter/material.dart';
import 'package:tic_tac_toe/firstpage.dart';
import 'package:tic_tac_toe/homepage.dart';

void main() {
  runApp(const tictactoe());
}
class tictactoe extends StatelessWidget {
  const tictactoe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstpage(),
    );
  }
}