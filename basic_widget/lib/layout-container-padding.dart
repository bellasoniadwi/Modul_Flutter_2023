import 'package:flutter/material.dart';

// LAYOUT - CONTAINER (PROPERTY PADDING)
class LayoutContainerPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Padding")),
          body: Container(
              padding: EdgeInsets.only(bottom: 30),
              margin: EdgeInsets.all(70),
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
