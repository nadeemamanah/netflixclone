import 'package:flutter/material.dart';
import 'package:netflixclone/screens/screens.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black),
    home: NavScreen(),
  ));
}
