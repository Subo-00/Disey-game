import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(Dicey());
}

class Dicey extends StatefulWidget {
  const Dicey({super.key});

  @override
  State<Dicey> createState() => _DiceyState();
}

class _DiceyState extends State<Dicey> {
  var leftNum = 1;
  var rightNum = 1;
  Color theColor = Colors.grey;
  int right = 0;
  int wrong = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: theColor,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: theColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SCORE',
              style: TextStyle(color: Colors.white, fontSize: 50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(right.toString(),
                    style:
                        TextStyle(fontSize: 40, color: Colors.green.shade200)),
                Text(
                  ':',
                  style: TextStyle(fontSize: 40),
                ),
                Text(wrong.toString(),
                    style: TextStyle(fontSize: 40, color: Colors.red.shade800))
              ],
            ),
            Expanded(
              child: SizedBox(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          leftNum = Random().nextInt(6) + 1;
                          rightNum = Random().nextInt(6) + 1;

                          leftNum > rightNum
                              ? {theColor = Colors.green, right++}
                              : rightNum > leftNum
                                  ? {theColor = Colors.red, wrong++}
                                  : theColor = Colors.grey;
                        });
                      },
                      child: Image.asset('images/dice$leftNum.png')),
                ),
                Expanded(
                    child: TextButton(
                  onPressed: () {
                    setState(() {
                      leftNum = Random().nextInt(6) + 1;
                      rightNum = Random().nextInt(6) + 1;

                      leftNum < rightNum
                          ? {theColor = Colors.green, right++}
                          : rightNum < leftNum
                              ? {theColor = Colors.red, wrong++}
                              : theColor = Colors.grey;
                    });
                  },
                  child: Image.asset('images/dice$rightNum.png'),
                ))
              ],
            ),
            Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
