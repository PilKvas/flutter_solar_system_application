// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'space_images_bloc.dart';

@immutable
sealed class SpaceImagesState {}

final class SpaceImagesInitial extends SpaceImagesState {}

class PlanetInitial extends SpaceImagesState {}

class SpaceImagesLoading extends SpaceImagesState {}

class SpaceImagesLoaded extends SpaceImagesState {
  SpaceImagesLoaded({required this.spaceImages});

  final List<SpaceImage> spaceImages;
}

class SpaceImagesError extends SpaceImagesState {
  SpaceImagesError({
    required this.error,
  });

  final Object error;
}
