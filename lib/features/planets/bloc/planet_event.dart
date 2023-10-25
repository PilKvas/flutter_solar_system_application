// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'planet_bloc.dart';

@immutable
abstract class PlanetEvent {}

class PlanetLoadData extends PlanetEvent {
  PlanetLoadData({
    required this.planetPlace,
  });

  final int planetPlace;
}

class SelectTab extends PlanetEvent {
  SelectTab({
    required this.planetPlace,
    required this.planet,
  });

  final List<PlanetData> planet;
  final int planetPlace;
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
