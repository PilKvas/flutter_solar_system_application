import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
// import 'package:flutter_solar_system_application/configuration/app_assets.dart';
import 'package:flutter_solar_system_application/planets/planet_screen.dart';
import 'package:flutter_solar_system_application/widgets/data_json.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';

/* Является 'строительныи лесом' где расположены все собственноручно написанные виджеты , ответственность за функциональную часть кнопок, скролл, хранит в себе все переменные виджетов, обработка нажатий по кнопкам, отображение данных плаенты Земля, Логика отображения, Стилизация*/

class PlanetNeptuneScreen extends StatelessWidget {
  final queue = 8;
  const PlanetNeptuneScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PlanetScreen(
        data: PlanetData(
          title: planetAsset[queue]['name'],
          overview: PlanetInfoData(
            info: planetAsset[queue]['overview']['content'],
            asset: planetAsset[queue]['images']['planet'],
          ),
          // url: Uri.parse(planetAsset[2]['overview']['source'])),
          structure: PlanetInfoData(
            info: planetAsset[queue]['structure']['content'],
            asset: planetAsset[queue]['images']['internal'],
          ),
          // url: Uri.parse('https://en.wikipedia.org/wiki/Earth#Internal_structure')),
          surface: PlanetInfoData(
            info: planetAsset[queue]['geology']['content'],
            asset: planetAsset[queue]['images']['geology'],
            // url: Uri.parse('https://en.wikipedia.org/wiki/Earth#Surface')),
          ),
          rotationTime: planetAsset[queue]['rotation'],
          revolutionTime: planetAsset[queue]['revolution'],
          radius: planetAsset[queue]['radius'],
          averageTemperature: planetAsset[queue]['temperature'],
        ),
        buttonBackgroundColor: AppColors.earthColor,
        borderInfoColor: AppColors.earthColor);
  }
}
