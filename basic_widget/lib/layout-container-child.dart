import 'package:flutter/material.dart';

// LAYOUT - CONTAINER (PROPERTY CHILD)
class LayoutContainerChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Child")),
          body: Container(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
                onPrimary: Colors.white,
                textStyle: TextStyle(fontSize: 20),
              ),
              child: Text("Button"),
            ),
          )
      ),
    );
  }
}
