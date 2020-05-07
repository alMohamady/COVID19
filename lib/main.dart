import 'package:flutter/material.dart';
import 'data_source.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Circular',
      primaryColor: primaryBlack
    ),
    home: HomePage(),
  ) );
}