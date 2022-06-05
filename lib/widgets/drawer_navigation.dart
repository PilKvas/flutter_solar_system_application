import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configurations.dart';
import 'package:flutter_solar_system_application/main_navigation.dart';
import 'package:flutter_solar_system_application/widgets/nav_row.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NavRow(
              planetSvgAsset: AppComponents.mercuryOverviewAsset,
              route: MainNavigationRouteNames.planetMercury,
              planetName: 'Mercury',
            ),
            NavRow(
              planetSvgAsset: AppComponents.venusOverviewAsset,
              route: MainNavigationRouteNames.planetVenus,
              planetName: 'Venus',
            ),
            NavRow(
              planetSvgAsset: AppComponents.earthOverviewAsset,
              route: MainNavigationRouteNames.planetEarth,
              planetName: 'Earth',
            ),
            NavRow(
              planetSvgAsset: AppComponents.marsOverviewAsset,
              route: MainNavigationRouteNames.planetMars,
              planetName: 'Mars',
            ),
            NavRow(
              planetSvgAsset: AppComponents.jupiterOverviewAsset,
              route: MainNavigationRouteNames.planetJuputer,
              planetName: 'Jupiter',
            ),
            NavRow(
              planetSvgAsset: AppComponents.saturnOverviewAsset,
              route: MainNavigationRouteNames.planetSaturn,
              planetName: 'Saturn',
            ),
            NavRow(
              planetSvgAsset: AppComponents.uranusOverviewAsset,
              route: MainNavigationRouteNames.planetUranus,
              planetName: 'Uranus',
            ),
            NavRow(
              planetSvgAsset: AppComponents.neptuneOverviewAsset,
              route: MainNavigationRouteNames.planetUranus,
              planetName: 'Neptune',
            ),
          ],
        ));
  }
}
