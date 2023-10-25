

class PlanetData {
  String name;
  Overview overview;
  Overview structure;
  Overview geology;
  String rotation;
  String revolution;
  String radius;
  String temperature;
  Images images;

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

  @override
  String toString() {
    return 'PlanetData(name: $name, overview: $overview, structure: $structure, geology: $geology, rotation: $rotation, revolution: $revolution, radius: $radius, temperature: $temperature, images: $images)';
  }
}

class Overview {
  String content;
  String source;

  Overview({required this.content, required this.source});

  factory Overview.fromJson(Map<String, dynamic> json) {
    return Overview(
      content: json['content'] ?? '',
      source: json['source'] ?? '',
    );
  }
}

class Images {
  String planet;
  String internal;
  String geology;

  Images({required this.planet, required this.internal, required this.geology});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      planet: json['planet'] ?? '',
      internal: json['internal'] ?? '',
      geology: json['geology'] ?? '',
    );
  }
}