import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_solar_system_application/features/planets/bloc/planet_bloc.dart';
import 'package:flutter_solar_system_application/features/space_images.dart/bloc/space_images_bloc.dart';
import 'package:flutter_solar_system_application/repository/planet_repository.dart';
import 'package:flutter_solar_system_application/routes/main_navigation.dart';
import 'package:flutter_solar_system_application/theme/theme.dart';

class SolarSystemApp extends StatelessWidget {
  const SolarSystemApp({Key? key}) : super(key: key);

  static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PlanetRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PlanetBloc>(
            create: (context) => PlanetBloc(),
          ),
          BlocProvider<SpaceImagesBloc>(
            create: (context) => SpaceImagesBloc(),
          ),
        ],
        child: MaterialApp(
          theme: planetDarkTheme(context),
          debugShowCheckedModeBanner: false,
          title: 'Solar System',
          initialRoute: mainNavigation.initialRoute,
          routes: mainNavigation.routes,
        ),
      ),
    );
  }
}
