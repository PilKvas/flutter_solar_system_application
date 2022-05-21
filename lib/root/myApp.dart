// Тут тоже линтер тебе подсказал, что название файлов как раз оформляется
// в lowercase. То есть корректное название файла - my_app.dart
import 'package:flutter/material.dart';
import '../Planets/planet_mercury.dart';
import '../configurations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar System',
      home: const planet_Mercury(),
    );
  }
}
