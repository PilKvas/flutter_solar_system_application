// ignore_for_file: non_constant_identifier_names

import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configurations.dart';
import 'package:flutter_solar_system_application/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Тут тоже кодинг-стайл. Корректное название - `PlanetMercury`
//
// Я бы назвал `PlanetMercuryScreen`
// ignore: camel_case_types
class planet_Mercury extends StatefulWidget {
  const planet_Mercury({Key? key}) : super(key: key);

  @override
  _planet_MercuryState createState() => _planet_MercuryState();
}

// Тут аналогично по кодинг-стайлу
// ignore: camel_case_types
class _planet_MercuryState extends State<planet_Mercury> {
  final String body_first =
      "Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun's planets. Mercury is one of four terrestrial planets in the Solar System, and is a rocky body like Earth.";
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
      backgroundColor: background,
      endDrawer: Drawer(
          backgroundColor: background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Nav_Row(
                svg_planet: 'assets/planet-mercury.svg',
              ),
              const Nav_Row(
                svg_planet: 'assets/planet-venus.svg',
              ),
              const Nav_Row(
                svg_planet: 'assets/planet-earth.svg',
              ),
              const Nav_Row(
                svg_planet: 'assets/planet-mars.svg',
              ),
              const Nav_Row(
                svg_planet: 'assets/planet-jupiter.svg',
              ),
              const Nav_Row(
                svg_planet: 'assets/planet-saturn.svg',
              ),
              const Nav_Row(
                svg_planet: 'assets/planet-uranus.svg',
              ),
              const Nav_Row(
                svg_planet: 'assets/planet-neptune.svg',
              ),
            ],
          )),
      appBar: AppBar(
        backgroundColor: background,
        title: Text(
          'The planets'.toUpperCase(),
          style: GoogleFonts.antonio(
              textStyle: const TextStyle(
                  color: kwhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                  letterSpacing: -1.05)),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              // Тут высоту и ширину тоже можно было бы оформить в константы
              SvgPicture.asset(
                'assets/planet-mercury.svg',
                width: 111,
                height: 111,
              ),
              const SizedBox(
                height: 90,
              ),
              Text('Mercury',
                  style: GoogleFonts.antonio(
                    textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: kwhite),
                  )),
              const SizedBox(height: 40),
              Text(body_first,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.leagueSpartan(
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: kwhiteBody,
                        fontWeight: FontWeight.w300,
                        height: 1.3),
                  )),
              const SizedBox(
                height: 40,
              ),
              const PlanetInfo(left: 'ROTATION TIME', right: '58.6 DAYS'),
              const PlanetInfo(left: 'REVOLUTION TIME', right: '87.97 DAYS'),
              const PlanetInfo(left: 'RADIUS', right: '2,439.7 KM'),
              const PlanetInfo(left: 'AVERAGE TEMP.', right: '430°C'),
            ],
          ),
        ),
      ),
    ));
  }
}
