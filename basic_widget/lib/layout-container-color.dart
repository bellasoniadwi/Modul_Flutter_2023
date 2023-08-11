import 'package:flutter/material.dart';

// LAYOUT - CONTAINER (PROPERTY COLOR)
class LayoutContainerColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Color")),
          body: Container(
              margin: EdgeInsets.all(50),
              alignment: Alignment.center,
              color: Colors.pink,
              child: Text(
                'Selamat Belajar Flutter',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))),
    );
  }
}
