import 'dart:convert';

import 'package:flutter/material.dart';

List<Planet> planetFromJson(String str) =>
    List<Planet>.from(json.decode(str).map((x) => Planet.fromJson(x)));

class Planet {
  Planet({
    required this.name,
    required this.overview,
    required this.structure,
    required this.geology,
    required this.rotation,
    required this.revolution,
    required this.radius,
    required this.temperature,
    required this.images,
  });

  String name;
  Geology overview;
  Geology structure;
  Geology geology;
  String rotation;
  String revolution;
  String radius;
  String temperature;
  Images images;

  factory Planet.fromJson(Map<String, dynamic> json) => Planet(
        name: json["name"],
        overview: Geology.fromJson(json["overview"]),
        structure: Geology.fromJson(json["structure"]),
        geology: Geology.fromJson(json["geology"]),
        rotation: json["rotation"],
        revolution: json["revolution"],
        radius: json["radius"],
        temperature: json["temperature"],
        images: Images.fromJson(json["images"]),
      );
}

class Geology {
  Geology({
    required this.content,
    required this.source,
  });

  String content;
  String source;

  factory Geology.fromJson(Map<String, dynamic> json) => Geology(
        content: json["content"],
        source: json["source"],
      );
}

class Images {
  Images({
    required this.planet,
    required this.internal,
    required this.geology,
  });

  String planet;
  String internal;
  String geology;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        planet: json["planet"],
        internal: json["internal"],
        geology: json["geology"],
      );
}

// var planet = Planet.fromJson()

class PlanetApi {
  static Future<List<Planet>> getPlanetLocally(BuildContext context) async {
    final String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    return planetFromJson(jsonString);
  }
}
