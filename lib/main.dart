import 'package:flutter/material.dart';
import './src/pages/index.dart';
import 'src/constants/constants_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Higia call',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: IndexPage(),
    );
  }
}
