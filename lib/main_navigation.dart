import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/planets/planet_earth_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_jupiter_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_mars_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_mercury_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_neptune_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_saturn_screen.dart';
import 'package:flutter_solar_system_application/planets/planet_uranus_screen.dart.dart';
import 'package:flutter_solar_system_application/planets/planet_venus_screen.dart';


/* Хранение имменых роутов */

abstract class MainNavigationRouteNames {
  MainNavigationRouteNames._();

  static const planetMercury = '/';
  static const planetVenus = '/PlanetVenusScreen';
  static const planetEarth = '/PlanetEarthScreen';
  static const planetMars = '/PlanetMarsScreen';
  static const planetJupiter = '/PlanetJupiterScreen';
  static const planetSaturn = '/PlanetSaturnScreen';
  static const planetUranus = '/PlanetUranusScreen';
  static const planetNeptune = '/PlanetNeptuneScreen';
}

/* Блок декларации роутинга */ 

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.planetMercury;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.planetMercury: (_) => const PlanetMercuryScreen(),
    MainNavigationRouteNames.planetVenus: (_) => const PlanetVenusScreen(),
    MainNavigationRouteNames.planetEarth: (_) => const PlanetEarthScreen(),
    MainNavigationRouteNames.planetMars: (_) => const PlanetMarsScreen(),
    MainNavigationRouteNames.planetJupiter: (_) => const PlanetJupiterScreen(),
    MainNavigationRouteNames.planetSaturn: (_) => const PlanetSaturnScreen(),
    MainNavigationRouteNames.planetUranus: (_) => const PlanetUranusScreen(),
    MainNavigationRouteNames.planetNeptune: (_) => const PlanetNeptuneScreen(),
  };
}
