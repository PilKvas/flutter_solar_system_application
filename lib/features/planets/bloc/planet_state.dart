part of 'planet_bloc.dart';

@immutable
abstract class PlanetState {}

class PlanetInitial extends PlanetState {}

class PlanetLoading extends PlanetState {}

class PlanetLoaded extends PlanetState {
  PlanetLoaded(
    this.planets, {
    this.tabState,
    this.mainInfo,
    this.mainSvg,
  });

  final String? mainInfo;
  final String? mainSvg;
  final List<PlanetData> planets;
  final TabState? tabState;
}

class PlanetError extends PlanetState {
  PlanetError(this.error);

  final Object error;
}
