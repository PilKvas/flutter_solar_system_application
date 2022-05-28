import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configurations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class NavRow extends StatelessWidget {
  static const Size svgPlanetSize = Size.square(25);
  final String route;
  final String planetSvgAsset;
  final String planetName;
  const NavRow({Key? key, required this.planetSvgAsset, required this.route, required this.planetName, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.0),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0, color: AppColors.borderColor,
              )
            )
          ),
          child: TextButton(
            style: ButtonStyle(padding: MaterialStateProperty.all(const EdgeInsets.all(25))),
            onPressed: (){
              Navigator.pushNamed(context, route);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  planetSvgAsset,
                  height: svgPlanetSize.height,
                  width: svgPlanetSize.width,
                ),
                Text(
                   planetName.toUpperCase(),
                  style: GoogleFonts.leagueSpartan(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      letterSpacing: 1.36,
                      color: AppColors.kwhite,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_right_rounded, color: AppColors.kwhite)
              ],
            ),
          ),
        ),
      ],
    );
  }
}