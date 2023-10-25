// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'planet_bloc.dart';

@immutable
abstract class PlanetEvent {}

class PlanetLoadData extends PlanetEvent {
  final int planetPlace;
  PlanetLoadData({
    required this.planetPlace,
  });
}

class SelectTab extends PlanetEvent {
  final int planetPlace;
  final List<PlanetData> planet;
  SelectTab({
    required this.planetPlace,
    required this.planet,
  });
}

class OverviewTabSelect extends SelectTab {
  OverviewTabSelect({required super.planetPlace, required super.planet});
}

class StructureTabSelect extends SelectTab {
  StructureTabSelect({required super.planetPlace, required super.planet});
}

class SurfaceTabSelect extends SelectTab {
  SurfaceTabSelect({required super.planetPlace, required super.planet});
}
