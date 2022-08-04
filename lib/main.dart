import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/main_navigation.dart';
import 'package:flutter_solar_system_application/widgets/app_theme.dart';
import 'package:flutter_solar_system_application/widgets/state_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlanetProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Solar System',
        initialRoute: mainNavigation.initialRoute,
        routes: mainNavigation.routes,
        theme: planetTheme(),
      ),
    );
  }
}
