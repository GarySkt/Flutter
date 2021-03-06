import 'package:flutter/material.dart';
import '../models/card_color_model.dart';

class CardColor {

  static const baseColor = <Color>[
    Color.fromRGBO(61, 131, 223, 1.0), //lightblue
    Color.fromRGBO(114, 71, 200, 1.0), //Purple
    Color.fromRGBO(106, 188, 121, 1.0), //Green
    Color.fromRGBO(229, 92, 131, 1.0), //pink
    Color.fromRGBO(96, 200, 227, 1.0), //Cyan
    Color.fromRGBO(219, 157, 80, 1.0), //Orange
    Color.fromRGBO(60, 61, 63, 1.0), //Black
    Color.fromRGBO(222, 88, 116, 1.0), //Salmon
    Color.fromRGBO(128, 182, 234, 1.0), //LightCyan
  ];

    static List<CardColorModel> cardColors = new List<CardColorModel>.generate(
      baseColor.length, (int index)=>
      CardColorModel(isSelected: false, cardColor:index));
}