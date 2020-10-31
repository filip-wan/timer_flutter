import 'package:flutter/material.dart';
import 'package:timer_flutter/home.dart';
import 'package:timer_flutter/styles/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: buildThemeData(),
        home: Home(),
      );
}
