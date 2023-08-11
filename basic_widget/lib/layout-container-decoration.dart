import 'package:flutter/material.dart';

// LAYOUT - CONTAINER (PROPERTY DECORATION)
class LayoutContainerDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Contoh Decoration")),
          body: Container(
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: NetworkImage(
                      // 'https://media.suara.com/suara-partners/pekanbaru/thumbs/970x545/2023/05/23/1-penampilan-rony-parulian-salma-salsabil-pada-panggung-indonesia-idol-result-reunion.jpg'),
                      'https://assets.ayobandung.com/crop/0x0:0x0/750x500/webp/photo/2022/10/26/211001962.jpg'),
                  fit: BoxFit.fitWidth,
                ),
                border: Border.all(
                  color: Colors.pink,
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 9,
                    offset: Offset(8, 8), // Shadow position
                  ),
                ],
              ),
              height: 200,
              width: 300,
            margin: const EdgeInsets.only(left: 50.0, right: 30.0, top: 30),)),
    );
  }
}
