import 'package:bab_5/pages/home_page.dart';
import 'package:bab_5/pages/item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => ItemPage()
    },
    )
  );
}
