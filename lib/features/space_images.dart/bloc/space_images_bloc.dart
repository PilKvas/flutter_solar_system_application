import 'package:bloc/bloc.dart';
import 'package:flutter_solar_system_application/repository/models/space_image.dart';
import 'package:flutter_solar_system_application/repository/planet_repository.dart';
import 'package:meta/meta.dart';

part 'space_images_event.dart';

part 'space_images_state.dart';

class SpaceImagesBloc extends Bloc<SpaceImagesEvent, SpaceImagesState> {
  SpaceImagesBloc() : super(SpaceImagesInitial()) {
    on<SpaceImagesLoadData>((event, emit) async {
      try {
        emit(SpaceImagesLoading());
        List<SpaceImage> planet = await planetRepository.getSpaceImages();
        print(planet);
        emit(
          SpaceImagesLoaded(
            spaceImages: planet,
          ),
        );
      } catch (e) {
        print(e);
        emit(SpaceImagesError(error: e));
      }
    });
  }

  final PlanetRepository planetRepository = PlanetRepository();
}
