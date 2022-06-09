// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/main_navigation.dart';


/* Ответственность за точку входа в приложение и декларацию роутинга */

class MyApp extends StatelessWidget {
  static final mainNavigation = MainNavigation();

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar System',
      initialRoute: mainNavigation.initialRoute,
      routes: mainNavigation.routes,
    );
  }
}
