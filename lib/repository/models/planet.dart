class PlanetData {
  PlanetData({
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

  factory PlanetData.fromJson(Map<String, dynamic> json) {
    return PlanetData(
      name: json['name'] ?? '',
      overview: Overview.fromJson(json['overview'] ?? {}),
      structure: Overview.fromJson(json['structure'] ?? {}),
      geology: Overview.fromJson(json['geology'] ?? {}),
      rotation: json['rotation'] ?? '',
      revolution: json['revolution'] ?? '',
      radius: json['radius'] ?? '',
      temperature: json['temperature'] ?? '',
      images: Images.fromJson(json['images'] ?? {}),
    );
  }

  Overview geology;
  Images images;
  String name;
  Overview overview;
  String radius;
  String revolution;
  String rotation;
  Overview structure;
  String temperature;

  @override
  String toString() {
    return 'PlanetData(name: $name, overview: $overview, structure: $structure, geology: $geology, rotation: $rotation, revolution: $revolution, radius: $radius, temperature: $temperature, images: $images)';
  }
}

class Overview {
  Overview({required this.content, required this.source});

  factory Overview.fromJson(Map<String, dynamic> json) {
    return Overview(
      content: json['content'] ?? '',
      source: json['source'] ?? '',
    );
  }

  String content;
  String source;
}

class Images {
  Images({required this.planet, required this.internal, required this.geology});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      planet: json['planet'] ?? '',
      internal: json['internal'] ?? '',
      geology: json['geology'] ?? '',
    );
  }

  String geology;
  String internal;
  String planet;
}


enum TabState {
  overview,
  structure,
  surface,
}