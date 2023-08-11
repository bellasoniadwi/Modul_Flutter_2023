import 'package:flutter/material.dart';

// LAYOUT - CONTAINER (PROPERTY MARGIN)
class LayoutContainerMargin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Margin")),
          body: Container(
              margin: EdgeInsets.all(60),
              height: 200,
              width: 300,
              alignment: Alignment.center,
              color: Colors.pink,
              child: Text(
                'Selamat Belajar Flutter',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ))),
    );
  }
}

