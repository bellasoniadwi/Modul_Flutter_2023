import 'package:flutter/material.dart';

// LAYOUT - ROW
class LayoutRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Row Widget")),
        body: Row(
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
