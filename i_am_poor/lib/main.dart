import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am not poor'),
          backgroundColor: Colors.redAccent[900],
        ),
        backgroundColor: Colors.redAccent,
        body: Center(
          child: Image(
            image: AssetImage('images/img-1.png'),
          ),
        ),
      ),
    ),
  );
}
