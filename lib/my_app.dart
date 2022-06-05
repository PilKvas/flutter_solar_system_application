// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/main_navigation.dart';
import 'package:flutter_solar_system_application/planets/planet_earth_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_jupiter_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_mars_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_mercury_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_neptune_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_saturn_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_uranus_screen.dart.dart';
import 'package:flutter_solar_system_application/planets/planet_venus_screen.dart';

class MyApp extends StatelessWidget {

  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar System',
      initialRoute: mainNavigation.initialRoute,
      routes: mainNavigation.routes,
    );
  }
}