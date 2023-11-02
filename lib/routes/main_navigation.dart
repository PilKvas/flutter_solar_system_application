import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/features/planets/view/view.dart';
import 'package:flutter_solar_system_application/theme/app_colors.dart';

/* Хранение именных роутов */

abstract class MainNavigationRouteNames {
  MainNavigationRouteNames._();

  static const planetEarth = 'PlanetEarthScreen';
  static const planetJupiter = 'PlanetJupiterScreen';
  static const planetMars = 'PlanetMarsScreen';
  static const planetMercury = '/';
  static const planetNeptune = 'PlanetNeptuneScreen';
  static const planetSaturn = 'PlanetSaturnScreen';
  static const planetUranus = 'PlanetUranusScreen';
  static const planetVenus = 'PlanetVenusScreen';
}

/* Блок декларации роутинга */

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.planetMercury;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.planetMercury: (_) => const PlanetScreen(
          planetPlace: 0,
          planetColor: AppColors.mercuryColor,
        ),
    MainNavigationRouteNames.planetVenus: (_) => const PlanetScreen(
          planetPlace: 1,
          planetColor: AppColors.venusColor,
        ),
    MainNavigationRouteNames.planetEarth: (_) => const PlanetScreen(
          planetPlace: 2,
          planetColor: AppColors.earthColor,
        ),
    MainNavigationRouteNames.planetMars: (_) => const PlanetScreen(
          planetPlace: 3,
          planetColor: AppColors.marsColor,
        ),
    MainNavigationRouteNames.planetJupiter: (_) => const PlanetScreen(
          planetPlace: 4,
          planetColor: AppColors.jupiterColor,
        ),
    MainNavigationRouteNames.planetSaturn: (_) => const PlanetScreen(
          planetPlace: 5,
          planetColor: AppColors.saturnColor,
        ),
    MainNavigationRouteNames.planetUranus: (_) => const PlanetScreen(
          planetPlace: 6,
          planetColor: AppColors.uranusColor,
        ),
    MainNavigationRouteNames.planetNeptune: (_) => const PlanetScreen(
          planetPlace: 7,
          planetColor: AppColors.neptuneColor,
        ),
  };
}
