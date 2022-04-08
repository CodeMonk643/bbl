import 'colors.dart';
import 'package:flutter/material.dart';
import 'screens/select.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: primSwat,
    ),
    home: Select(),
    debugShowCheckedModeBanner: false,
  ));
}