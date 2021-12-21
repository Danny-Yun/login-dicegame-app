import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Dice Game'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(37),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset을 통해 더 간결하게
                Expanded(child: Image.asset('images/dice$leftDice.png')),
                // Image(image: AssetImage('images/dice1.png'),
                SizedBox(width: 20),
                Expanded(child: Image.asset('images/dice$rightDice.png')),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ButtonTheme(
            minWidth: 100,
            height: 60,
            child: ElevatedButton(
              child: Icon(Icons.play_arrow, size: 50),
              style: ElevatedButton.styleFrom(
                primary: Colors.lime,
              ),
              onPressed: () {
                setState(() {
                  leftDice = Random().nextInt(6) + 1;
                  rightDice = Random().nextInt(6) + 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
