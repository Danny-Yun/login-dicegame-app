import 'package:flutter/material.dart';
import 'dart:math'; // 난수 생성시 필요한 라이브러리
import 'package:fluttertoast/fluttertoast.dart'; // 토스트 메시지 라이브러리

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
                showToast("왼쪽: $leftDice, 오른쪽: $rightDice");
              },
            ),
          ),
        ],
      ),
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      textColor: Colors.black87);
}
