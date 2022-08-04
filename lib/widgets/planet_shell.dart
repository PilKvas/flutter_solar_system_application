import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/widgets/app_bar.dart';
import 'package:flutter_solar_system_application/widgets/background.dart';
import 'package:flutter_solar_system_application/widgets/drawer_navigation.dart';

class PlanetShell extends StatelessWidget {
  const PlanetShell({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerNavigation(),
      appBar: AppBarWidget(
        appTitle: 'THE PLANETS',
      ),
      body: Background(
        child: body,
      ),
    );
  }
}
