import 'package:flutter/material.dart';

/* Font colors */

const kwhite = Colors.white;
const kwhiteBody = Color.fromRGBO(255, 255, 255, 0.7);
const background = Color.fromRGBO(7, 7, 36, 1);
const kgrey = Color.fromRGBO(7, 7, 36, 1);
const klighgrey = Color.fromRGBO(131, 131, 145, 1);
const borderColor = Color.fromRGBO(216, 216, 216, 0.3);

/*-------------------------------------*/

/* Planets */

const mercuryColor = Color.fromRGBO(65, 158, 187, 0.5);
const venusColor = Color(0x00eda249);
const earthColor = Color(0x006d2ed5);
const marsColor = Color(0x00d14c32);
const jupiterColor = Color(0x00d83a34);
const saturnColor = Color(0x00cd5120);
const uranusColor = Color(0x001ec1a2);
const neptuneColor = Color(0x002d68f0);

/*---------------------------------------*/

// Такие штуки как цвета удобнее оформлять как статические поля в классе.
// Чуть ниже пример

class AppColors {
  /// Этой строчкой мы делаем приватный именованный конструктор, чтобы
  /// было нельзя этот класс проинициализировать никаким образом. Это скорее
  /// хороший тон, чем какая-то обязательная вещь.
  AppColors._();

  static const mercury = Color.fromRGBO(65, 158, 187, 0.5);
  static const venus = Color(0x00eda249);
  static const earth = Color(0x006d2ed5);
  static const mars = Color(0x00d14c32);
  static const jupiter = Color(0x00d83a34);
  static const saturn = Color(0x00cd5120);
  static const uranus = Color(0x001ec1a2);
  static const neptune = Color(0x002d68f0);
}

void example() {
  // Искать такие цвета гораздо проще
  const color = AppColors.mercury;
}
