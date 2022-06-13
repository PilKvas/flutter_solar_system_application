import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_assets.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/planets/planet_common_screen.dart';

class PlanetEarthScreen extends StatelessWidget {
  const PlanetEarthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlanetCommonScreen(
      data: PlanetData(
        title: AppAssets.earthTitle,
        rotationTime: '228',
        averageTemperature: '228',
        radius: '228',
        revolutionTime: '228',
        overview: PlanetInfoData(
          asset: AppAssets.earthOverviewAsset,
          info: AppAssets.earthMainInfoOverview,
        ),
        structure: PlanetInfoData(
          asset: AppAssets.earthStructureAsset,
          info: AppAssets.earthMainInfoStructure,
        ),
        surface: PlanetInfoData(
          asset: AppAssets.earthOverviewAsset,
          info: AppAssets.earthMainInfoSurface,
        ),
      ),
      buttonBackgroundColor: AppColors.earthColor,
      borderInfoColor: AppColors.earthColor,
    );
  }
}
