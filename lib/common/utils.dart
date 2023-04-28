import 'package:flutter/material.dart';

class Utils {
  static Color getColorByType(String type) {
    var color = Color(0xffFFFFFF);

    switch (type) {
      case 'Grass':
        color = Color(0xFF71C558);
        break;
      case 'Fire':
        color = Color(0xFFEA7A3C);
        break;
      case 'Water':
        color = Color(0xFF539AE2);
        break;
      case 'Bug':
        color = Color(0xFF94BC4A);
        break;
      case 'Normal':
        color = Color(0xFFAAB09F);
        break;
      case 'Electric':
        color = Color(0xFFE5C531);
        break;
      case 'Poison':
        color = Color(0xFFB468B7);
        break;
      case 'Fighting':
        color = Color(0xFFCB5F48);
        break;
      case 'Ground':
        color = Color(0xFFCC9F4F);
        break;
      case 'Psychic':
        color = Color(0xFFE5709B);
        break;
      case 'Rock':
        color = Color(0xFFB2A061);
        break;
      case 'Ghost':
        color = Color(0xFF846AB6);
        break;
      case 'Ice':
        color = Color(0xFF70CBD4);
        break;
      case 'Dragon':
        color = Color(0xFF6A7BAF);
        break;
      default:
        color = Color(0xFFFFFFFF);
        break;
    }

    return color;
  }
}
