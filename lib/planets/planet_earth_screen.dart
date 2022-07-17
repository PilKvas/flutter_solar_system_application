import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_assets.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/planets/planet_screen.dart';
import 'package:flutter_solar_system_application/widgets/data_json.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';

/* Является 'строительныи лесом' где расположены все собственноручно написанные виджеты , ответственность за функциональную часть кнопок, скролл, хранит в себе все переменные виджетов, обработка нажатий по кнопкам, отображение данных плаенты Земля, Логика отображения, Стилизация*/

class PlanetEarthScreen extends StatelessWidget {
  const PlanetEarthScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PlanetScreen(
        data: PlanetData(
          title: planetAsset[2]['name'],
          overview: PlanetInfoData(
            info: planetAsset[2]['overview']['content'],
            asset: planetAsset[2]['images']['planet'],
          ),
          // url: Uri.parse(planetAsset[2]['overview']['source'])),
          structure: PlanetInfoData(
            info: planetAsset[2]['structure']['content'],
            asset: planetAsset[2]['images']['internal'],
          ),
          // url: Uri.parse('https://en.wikipedia.org/wiki/Earth#Internal_structure')),
          surface: PlanetInfoData(
            info: planetAsset[2]['geology']['content'],
            asset: planetAsset[2]['images']['geology'],
            // url: Uri.parse('https://en.wikipedia.org/wiki/Earth#Surface')),
          ),
          rotationTime: planetAsset[2]['rotation'],
          revolutionTime: planetAsset[2]['revolution'],
          radius: planetAsset[2]['radius'],
          averageTemperature: planetAsset[2]['temperature'],
        ),
        buttonBackgroundColor: AppColors.earthColor,
        borderInfoColor: AppColors.earthColor);
  }
}
