import 'package:flutter_solar_system_application/repository/models/models.dart';
import 'package:flutter_solar_system_application/repository/models/space_image.dart';

abstract class PlanetRepositoryInterface {
  Future<List<PlanetData>> getPlanet();
  Future<List<SpaceImage>> getSpaceImages();
}
