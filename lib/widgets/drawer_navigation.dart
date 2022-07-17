import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configuration/app_assets.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/main_navigation.dart';
import 'package:flutter_solar_system_application/widgets/nav_row.dart';

/* Ответственность за отображение виджета Drawer и его чайлдов*/

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
          children: const[
            NavRow(
              planetSvgAsset: AppAssets.mercuryOverviewAsset,
              route: MainNavigationRouteNames.planetMercury,
              planetName: AppAssets.mercuryTitle,
            ),
            NavRow(
              planetSvgAsset: AppAssets.venusOverviewAsset,
              route: MainNavigationRouteNames.planetVenus,
              planetName: AppAssets.venusTitle,
            ),
            NavRow(
              planetSvgAsset: AppAssets.earthOverviewAsset,
              route: MainNavigationRouteNames.planetEarth,
              planetName: AppAssets.earthTitle,
            ),
            NavRow(
              planetSvgAsset: AppAssets.marsOverviewAsset,
              route: MainNavigationRouteNames.planetMars,
              planetName: AppAssets.marsTitle,
            ),
            NavRow(
              planetSvgAsset: AppAssets.jupiterOverviewAsset,
              route: MainNavigationRouteNames.planetJupiter,
              planetName: AppAssets.jupiterTitle,
            ),
            NavRow(
              planetSvgAsset: AppAssets.saturnOverviewAsset,
              route: MainNavigationRouteNames.planetSaturn,
              planetName: AppAssets.saturnTitle,
            ),
            NavRow(
              planetSvgAsset: AppAssets.uranusOverviewAsset,
              route: MainNavigationRouteNames.planetUranus,
              planetName: AppAssets.uranusTitle,
            ),
            NavRow(
              planetSvgAsset: AppAssets.neptuneOverviewAsset,
              route: MainNavigationRouteNames.planetUranus,
              planetName: AppAssets.uranusTitle,
            ),
          ],
        ));
  }
}
