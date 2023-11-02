import 'package:flutter_solar_system_application/repository/models/models.dart';

abstract class PlanetRepositoryInterface {
  Future<List<PlanetData>> getPlanet();
}
