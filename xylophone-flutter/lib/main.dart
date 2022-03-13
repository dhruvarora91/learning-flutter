import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Expanded buildKey(int soundNumber, Color colorName) {
    return Expanded(
      child: MaterialButton(
        onPressed: () {
          final player = AudioCache();
          player.play('note$soundNumber.wav');
        },
        color: colorName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(1, Colors.purple),
              buildKey(2, Colors.indigo),
              buildKey(3, Colors.blue),
              buildKey(4, Colors.green),
              buildKey(5, Colors.yellow),
              buildKey(6, Colors.orange),
              buildKey(7, Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
