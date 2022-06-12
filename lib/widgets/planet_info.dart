import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetInfo extends StatelessWidget {
  final Color borderInfoColor;
  final String leftSideText;
  final String rightSideText;

  const PlanetInfo(
      {Key? key,
      required this.leftSideText,
      required this.rightSideText,
      required this.borderInfoColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(border: Border.all(color: borderInfoColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            leftSideText,
            style: GoogleFonts.leagueSpartan(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: AppColors.lightGrey)),
          ),
          Text(
            rightSideText,
            style: GoogleFonts.antonio(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: AppColors.white,
                    letterSpacing: -0.75)),
          ),
        ],
      ),
    );
  }
}
