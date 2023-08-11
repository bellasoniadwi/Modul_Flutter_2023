import 'package:flutter/material.dart';

// LAYOUT - LIST VIEW
class LayoutListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Contoh ListView Widget"),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              color: Colors.pink[200],
              alignment:Alignment.topLeft,
              height: 200,
              child: Text("ListView widget digunanakan untuk menampilkan data dalam bentuk list dan jika datanya melebihi dari render box maka halaman tersebut dapat di scroll.", style: TextStyle(fontSize:25,color: Colors.white)),
            ),
            Container(
              color: Colors.pink[400],
              alignment:Alignment.topLeft,
              child: Text("ListView widget digunanakan untuk menampilkan data dalam bentuk list dan jika datanya melebihi dari render box maka halaman tersebut dapat di scroll.", style: TextStyle(fontSize:25,color: Colors.white)),
              height: 250.0,
            ),
            Container(
              color: Colors.pink[700],
              alignment:Alignment.topLeft,
              child: Text("ListView widget digunanakan untuk menampilkan data dalam bentuk list dan jika datanya melebihi dari render box maka halaman tersebut dapat di scroll.", style: TextStyle(fontSize:25,color: Colors.white)),
              height: 400.0,
            ),
          ],
        ),
      ),
    );
  }
}
