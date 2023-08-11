import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
// import file
import 'button.dart';
import 'cupertino.dart';
import 'date-time-pickers.dart';
import 'dialog.dart';
import 'image.dart';
import 'input-selection.dart';
import 'layout-column.dart';
import 'layout-container-alignment.dart';
import 'layout-container-child.dart';
import 'layout-container-color.dart';
import 'layout-container-decoration.dart';
import 'layout-container-height-width.dart';
import 'layout-container-margin.dart';
import 'layout-container-padding.dart';
import 'layout-container-transform.dart';
import 'layout-gridview.dart';
import 'layout-listview.dart';
import 'layout-row.dart';
import 'layout-stack.dart';
import 'scaffold.dart';
import 'text.dart';
import 'tugas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tugas(),
    );
  }
}
