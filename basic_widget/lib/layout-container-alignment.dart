import 'package:flutter/material.dart';

// LAYOUT - CONTAINER (PROPERTY ALIGNMENT)
class LayoutContainerAlignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Aligment")),
          body: Container(
              alignment: Alignment.center,
              child: Text(
                'Selamat Belajar Flutter',
                style: TextStyle(
                  fontSize: 20,
                ),
              ))),
    );
  }
}
