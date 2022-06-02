// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/planets/planet_earth_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_jupiter_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_mars_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_mercury_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_neptune_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_saturn_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_uranus_screen.dart.dart';
import 'package:flutter_solar_system_application/planets/planet_venus_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar System',
      initialRoute: '/',
      routes: {
        '/': (context) => const PlanetMercuryScreen(),
        '/planet_venus_screen': (context) => const PlanetVenusScreen(),
        '/planet_earth_screen': (context) => const PlanetEarthScreen(),
        '/planet_mars_screen': (context) => const PlanetMarsScreen(),
        '/planet_jupiter_screen': (context) => const PlanetJupiterScreen(),
        '/planet_saturn_screen': (context) => const PlanetSaturnScreen(),
        '/planet_uranus_screen': (context) => const PlanetUranusScreen(),
        '/planet_neptune_screen': (context) => const PlanetNeptuneScreen(),
      },
    );
  }
}