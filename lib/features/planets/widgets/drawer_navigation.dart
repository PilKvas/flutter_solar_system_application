// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter_solar_system_application/features/planets/bloc/planet_bloc.dart';
import 'package:flutter_solar_system_application/features/planets/widgets/widgets.dart';
import 'package:flutter_solar_system_application/routes/main_navigation.dart';

/* Ответственность за отображение виджета Drawer и его чайлдов*/

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  void initState() {
    context.read<PlanetBloc>().add(
          PlanetLoadData(planetPlace: 0),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: Background(
      child: BlocBuilder<PlanetBloc, PlanetState>(
        builder: (context, state) {
          if (state is PlanetLoaded) {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/sun.json', width: 300, height: 300),
                  ],
                ),
                const NavRow(
                  planetPlace: 0,
                  svgPlanetSize: Size.square(40),
                  route: MainNavigationRouteNames.planetMercury,
                ),
                const NavRow(
                  planetPlace: 1,
                  svgPlanetSize: Size.square(80),
                  route: MainNavigationRouteNames.planetVenus,
                ),
                const NavRow(
                  planetPlace: 2,
                  svgPlanetSize: Size.square(100),
                  route: MainNavigationRouteNames.planetEarth,
                ),
                const NavRow(
                  planetPlace: 3,
                  svgPlanetSize: Size.square(50),
                  route: MainNavigationRouteNames.planetMars,
                ),
                const NavRow(
                  planetPlace: 4,
                  svgPlanetSize: Size.square(200),
                  route: MainNavigationRouteNames.planetJupiter,
                ),
                const NavRow(
                  planetPlace: 5,
                  svgPlanetSize: Size.square(190),
                  route: MainNavigationRouteNames.planetSaturn,
                  // planetName: AppAssets.saturnTitle,
                ),
                const NavRow(
                  planetPlace: 6,
                  svgPlanetSize: Size.square(130),
                  route: MainNavigationRouteNames.planetUranus,
                ),
                const NavRow(
                  planetPlace: 7,
                  svgPlanetSize: Size.square(120),
                  route: MainNavigationRouteNames.planetNeptune,
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    ));
  }
}
