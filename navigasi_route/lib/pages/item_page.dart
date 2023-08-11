import 'package:flutter/material.dart';
import 'package:bab_5/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Shopping Detail'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Card(
          child: Container(
              height: 320,
              margin: EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Nama Item : "+itemArgs.nama),
                    Text("Harga     : "+itemArgs.harga.toString()),
                  ],
                ),
              ),
          ),
        ),
      ),
    );
  }
}