import 'package:flutter/material.dart';
import 'package:movie_app/home.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),//nombre de la clase
    theme: new ThemeData.dark(),
    ));
  
}