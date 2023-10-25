import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_solar_system_application/features/planets/bloc/planet_bloc.dart';
import 'package:flutter_solar_system_application/repository/planet_repository_impl.dart';
import 'package:flutter_solar_system_application/routes/main_navigation.dart';
import 'package:flutter_solar_system_application/theme/theme.dart';

class SolarSystemApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const SolarSystemApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PlanetRepository(),
      child: BlocProvider(
        create: (context) => PlanetBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Solar System',
          initialRoute: mainNavigation.initialRoute,
          routes: mainNavigation.routes,
          theme: planetDarkTheme(context),
        ),
      ),
    );
  }
}
