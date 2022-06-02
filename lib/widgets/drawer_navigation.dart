import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configurations.dart';
import 'package:flutter_solar_system_application/widgets/nav_row.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(backgroundColor: AppColors.background,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [

        NavRow(
          planetSvgAsset: AppComponents.mercuryOverviewAsset,
          route: '/',
          planetName: 'Mercury',
        ),
        NavRow(
          planetSvgAsset: AppComponents.venusOverviewAsset,
          route: '/planet_venus_screen', 
          planetName: 'Venus',
        ),
        NavRow(
          planetSvgAsset: AppComponents.earthOverviewAsset,
          route: '/planet_earth_screen',
          planetName: 'Earth',
        ),
        NavRow(
          planetSvgAsset: AppComponents.marsOverviewAsset, 
          route: '/planet_mars_screen',
          planetName: 'Mars',
        ),
        NavRow(
          planetSvgAsset: AppComponents.jupiterOverviewAsset,
          route: '/planet_jupiter_screen',
          planetName: 'Jupiter',
        ),
        NavRow(
          planetSvgAsset: AppComponents.saturnOverviewAsset,
          route: '/planet_saturn_screen',
          planetName: 'Saturn',
        ),
        NavRow(
          planetSvgAsset: AppComponents.uranusOverviewAsset,
          route: '/planet_uranus_screen',
          planetName: 'Uranus',
        ),
        NavRow(
          planetSvgAsset: AppComponents.neptuneOverviewAsset,
          route: '/planet_neptune_screen',
          planetName: 'Neptune',
        ),
      
      ],
    ) 
    );
  }
}