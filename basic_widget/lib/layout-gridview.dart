import 'package:flutter/material.dart';

// LAYOUT - GRID VIEW
class LayoutGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contoh GridView Widget"),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              color: Colors.pink[100],
              alignment:Alignment.center,
              child: Text("1", style: TextStyle(fontSize:30,color: Colors.white)),
            ),
            Container(
              color: Colors.pink[200],
              alignment:Alignment.center,
              child: Text("2", style: TextStyle(fontSize:30,color: Colors.white)),
              height: 400.0,
              width: 300.0,
            ),
            Container(
              color: Colors.pink[300],
              alignment:Alignment.center,
              child: Text("3", style: TextStyle(fontSize:30,color: Colors.white)),
              height: 200.0,
              width: 200.0,
            ),
            Container(
              color: Colors.pink[400],
              alignment:Alignment.center,
              child: Text("4", style: TextStyle(fontSize:30,color: Colors.white)),
              height: 200.0,
              width: 200.0,
            ),
            Container(
              color: Colors.pink,
              alignment:Alignment.center,
              child: Text("5", style: TextStyle(fontSize:30,color: Colors.white)),
              height: 200.0,
              width: 200.0,
            ),
            Container(
              color: Colors.pink[600],
              alignment:Alignment.center,
              child: Text("6", style: TextStyle(fontSize:30,color: Colors.white)),
              height: 200.0,
              width: 200.0,
            ),
            Container(
              color: Colors.pink[700],
              alignment:Alignment.center,
              child: Text("7", style: TextStyle(fontSize:30,color: Colors.white)),
              height: 200.0,
              width: 200.0,
            ),
            Container(
              color: Colors.pink[800],
              alignment:Alignment.center,
              child: Text("8", style: TextStyle(fontSize:30,color: Colors.white)),
              height: 200.0,
              width: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
