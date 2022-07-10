import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_assets.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/planets/planet_common_screen.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';

/* Является 'строительныи лесом' где расположены все собственноручно написанные виджеты , ответственность за функциональную часть кнопок, скролл, хранит в себе все переменные виджетов, обработка нажатий по кнопкам, отображение данных плаенты Земля, Логика отображения, Стилизация*/

class PlanetEarthScreen extends StatelessWidget {
  const PlanetEarthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PlanetCommonScreen(
        data: PlanetData(
          title: AppAssets.earthTitle,
          overview: PlanetInfoData(
              info: AppAssets.earthMainInfoOverview,
              asset: AppAssets.earthOverviewAsset, 
              url: Uri.parse('https://en.wikipedia.org/wiki/Earth')),
          structure: PlanetInfoData(
              info: AppAssets.earthMainInfoStructure,
              asset: AppAssets.earthStructureAsset, 
              url: Uri.parse('https://en.wikipedia.org/wiki/Earth#Internal_structure')),
          surface: PlanetInfoData(
              info: AppAssets.earthMainInfoSurface,
              asset: 'assets/geology-earth.png',
              url: Uri.parse('https://en.wikipedia.org/wiki/Earth#Surface')),
          rotationTime: '58.6',
          revolutionTime: '87.97 DAYS',
          radius: '2,439.7 KM',
          averageTemperature: '430°C',
        ),
        buttonBackgroundColor: AppColors.earthColor,
        borderInfoColor: AppColors.earthColor);
  }
}
