import 'package:flutter/material.dart';

// LAYOUT - CONTAINER (PROPERTY HEIGHT & WIDTH)
class LayoutContainerHeightWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Height dan Width")),
          body: Container(
              margin: EdgeInsets.all(50),
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

