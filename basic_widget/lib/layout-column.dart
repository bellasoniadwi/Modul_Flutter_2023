import 'package:flutter/material.dart';

// LAYOUT - COLUMN
class LayoutColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Column Widget")),
        body: Column(
          children: [
            Container(
              color: Colors.pink[200],
              child: FlutterLogo(
                size: 120.0,
              ),
            ),
            Container(
              color: Colors.pink[400],
              child: FlutterLogo(
                size: 120.0,
              ),
            ),
            Container(
              color: Colors.pink[700],
              child: FlutterLogo(
                size: 120.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
