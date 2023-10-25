import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/features/planets/view/view.dart';
import 'package:flutter_solar_system_application/repository/models/planet.dart';
import 'package:flutter_solar_system_application/repository/planet_repository_impl.dart';
import 'package:meta/meta.dart';

part 'planet_event.dart';
part 'planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  PlanetBloc() : super(PlanetInitial()) {
    on<PlanetLoadData>((event, emit) async {
      try {
        emit(PlanetLoading());
        List<PlanetData> planet = await planetRepository.getPlanet();
        emit(
          PlanetLoaded(
            planet,
            tabState: TabState.overview,
            mainInfo: planet[event.planetPlace].overview.content,
            mainSvg: planet[event.planetPlace].images.planet,
          ),
        );
      } catch (e) {
        emit(PlanetError(e));

      }
    });

    on<OverviewTabSelect>((event, emit) async {
      emit(
        PlanetLoaded(
          event.planet,
          tabState: TabState.overview,
          mainInfo: event.planet[event.planetPlace].overview.content,
          mainSvg: event.planet[event.planetPlace].images.planet,
        ),
      );
    });
    on<StructureTabSelect>((event, emit) async {
      emit(
        PlanetLoaded(
          event.planet,
          tabState: TabState.structure,
          mainInfo: event.planet[event.planetPlace].structure.content,
          mainSvg: event.planet[event.planetPlace].images.internal,
        ),
      );
    });

    on<SurfaceTabSelect>((event, emit) async {
      emit(
        PlanetLoaded(
          event.planet,
          tabState: TabState.surface,
          mainInfo: event.planet[event.planetPlace].geology.content,
          mainSvg: event.planet[event.planetPlace].images.planet,
        ),
      );
    });
  }

  final planetRepository = PlanetRepository();
}
