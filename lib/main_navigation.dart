import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/planets/planet_earth_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_jupiter_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_mars_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_mercury_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_neptune_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_saturn_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_uranus_screen.dart.dart';
import 'package:flutter_solar_system_application/planets/planet_venus_screen.dart';

abstract class MainNavigationRouteNames {
  MainNavigationRouteNames._();

  static const planetMercury = '/';
  static const planetVenus = '/PlanetVenusScreen';
  static const planetEarth = '/PlanetEarthScreen';
  static const planetMars = '/PlanetMarsScreen';
  static const planetJuputer = '/PlanetJupiterScreen';
  static const planetSaturn = '/PlanetSaturnScreen';
  static const planetUranus = '/PlanetUranusScreen';
  static const planetNeptune = '/PlanetNeptuneScreen';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.planetMercury;
  final routes = <String, Widget Function(BuildContext)>{
    '/': (_) => const PlanetMercuryScreen(),
    '/planet_venus_screen': (_) => const PlanetVenusScreen(),
    '/planet_earth_screen': (_) => const PlanetEarthScreen(),
    '/planet_mars_screen': (_) => const PlanetMarsScreen(),
    '/planet_jupiter_screen': (_) => const PlanetJupiterScreen(),
    '/planet_saturn_screen': (_) => const PlanetSaturnScreen(),
    '/planet_uranus_screen': (_) => const PlanetUranusScreen(),
    '/planet_neptune_screen': (_) => const PlanetNeptuneScreen(),
  };
}
