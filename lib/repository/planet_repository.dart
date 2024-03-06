// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'package:flutter_solar_system_application/repository/models/planet.dart';
import 'package:flutter_solar_system_application/repository/models/space_image.dart';
import 'package:flutter_solar_system_application/repository/planet_repository_interface.dart';

class PlanetRepository implements PlanetRepositoryInterface {
  @override
  Future<List<PlanetData>> getPlanet() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);
    List<PlanetData> planets = [];

    for (var jsonPlanet in jsonList) {
      PlanetData planet = PlanetData.fromJson(jsonPlanet);
      planets.add(planet);
    }
    return planets;
  }

  @override
  Future<List<SpaceImage>> getSpaceImages() async {
    final response = await Dio()
        .get('https://api.nasa.gov/planetary/apod?api_key=HapEuV1Wkteb5Ok3fJEvuVDdaYgLFgTLSw8uEw4P&count=15');

    print(response);
    List<SpaceImage> spaceImages = (response.data as List).map((json) => SpaceImage.fromJson(json)).toList();

    return spaceImages;
  }
}
