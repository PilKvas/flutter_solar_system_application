class PlanetInfoData {
  final String info;
  final String asset;
  // final Uri url;

  PlanetInfoData({
    required this.info,
    required this.asset,
    // required this.url,
  });
}

class PlanetData {
  final String title;

  final PlanetInfoData overview;
  final PlanetInfoData structure;
  final PlanetInfoData surface;

  final String rotationTime;
  final String revolutionTime;
  final String radius;
  final String averageTemperature;

  PlanetData({
    required this.title,
    required this.overview,
    required this.structure,
    required this.surface,
    required this.rotationTime,
    required this.revolutionTime,
    required this.radius,
    required this.averageTemperature,
  });
}
