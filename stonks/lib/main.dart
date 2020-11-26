import 'package:flutter/material.dart';
import 'package:stonks/screens/stonks.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stonks(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue[700],
        accentColor: Colors.cyan[600],
      ),
    ),
  );
}
