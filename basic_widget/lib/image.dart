import 'package:flutter/material.dart';

// IMAGE WIDGET
class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Image(
        image: NetworkImage(
            'https://cdn-2.tstatic.net/kaltim/foto/bank/images/20230616_rony-salma.jpg'),
      ),
    );
  }
}