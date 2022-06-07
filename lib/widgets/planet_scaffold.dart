import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/widgets/background.dart';
import 'package:flutter_solar_system_application/widgets/drawer_navigation.dart';

/// Каркас экрана планет.
///
/// Это первый уровень декомпозиции, который можно здесь представить.
///
/// У нас есть AppBar, бэкграунд, а всё остальное - полёт фантазии.
///
/// Конкретно это тут существует только для примера того, как можно оформлять
/// шаблонные UI-компоненты.
class PlanetScaffold extends StatelessWidget {
  const PlanetScaffold({
    Key? key,
    required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerNavigation(),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'THE PLANETS',
          style: GoogleFonts.antonio(
            textStyle: const TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 28,
              letterSpacing: -1.05,
            ),
          ),
        ),
      ),
      body: Background(child: body),
    );
  }
}
