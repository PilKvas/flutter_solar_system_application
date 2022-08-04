import "package:flutter/material.dart";

// import 'package:flutter_solar_system_application/configuration/app_assets.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/planets/planet_screen.dart';
import 'package:flutter_solar_system_application/widgets/data_json.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';

/* Является 'строительныи лесом' где расположены все собственноручно написанные виджеты , ответственность за функциональную часть кнопок, скролл, хранит в себе все переменные виджетов, обработка нажатий по кнопкам, отображение данных плаенты Земля, Логика отображения, Стилизация*/

class PlanetUranusScreen extends StatelessWidget {
  final queue = 6;
  const PlanetUranusScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Planet>>(
      future: PlanetApi.getPlanetLocally(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final planetAsset = snapshot.data![queue];
          return PlanetScreen(
            data: PlanetData(
              title: planetAsset.name,
              overview: PlanetInfoData(
                info: planetAsset.overview.content,
                asset: planetAsset.images.planet,
                url: Uri.parse(planetAsset.overview.source),
              ),
              structure: PlanetInfoData(
                info: planetAsset.structure.content,
                asset: planetAsset.images.internal,
                url: Uri.parse(planetAsset.structure.source),
              ),
              surface: PlanetInfoData(
                info: planetAsset.geology.content,
                asset: planetAsset.images.geology,
                url: Uri.parse(planetAsset.geology.source),
              ),
              rotationTime: planetAsset.rotation,
              revolutionTime: planetAsset.revolution,
              radius: planetAsset.radius,
              averageTemperature: planetAsset.temperature,
              assetSize: 176,
            ),
            buttonBackgroundColor: AppColors.uranusColor,
            borderInfoColor: AppColors.uranusColor,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
