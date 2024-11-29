import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NeoBrutalist App',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'RobotoMono',
      ),
      home: HomePage(),
    );
  }
}
