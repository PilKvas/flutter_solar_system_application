// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Planets/planet_mercury.dart';
import '../configurations.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar System',
      home: const planet_Mercury(),
    );
  }
}