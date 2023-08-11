import 'package:flutter/material.dart';

// LAYOUT - STACK
class LayoutStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contoh Stack Widget"),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.pink[700],
              alignment:Alignment.bottomCenter,
              child: Text("Tumpukan Satu", style: TextStyle(fontSize:25,color: Colors.white)),
            ),
            Container(
              color: Colors.pink[400],
              alignment:Alignment.bottomCenter,
              child: Text("Tumpukan Dua", style: TextStyle(fontSize:25,color: Colors.white)),
              height: 400.0,
              width: 300.0,
            ),
            Container(
              color: Colors.pink[200],
              alignment:Alignment.bottomCenter,
              child: Text("Tumpukan Tiga", style: TextStyle(fontSize:25,color: Colors.white)),
              height: 200.0,
              width: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
