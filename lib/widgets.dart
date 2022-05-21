import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configurations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // ignore: sized_box_for_whitespace
    return Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                "assets/background-stars.svg",
                fit: BoxFit.cover,
              ),
            ),
            child,
          ],
        ));
  }
}

// ignore: camel_case_types
class Planet_info extends StatelessWidget {
  final String left;
  final String right;
  const Planet_info({Key? key, required this.left, required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(border: Border.all(color: mercuryColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            left,
            style: GoogleFonts.leagueSpartan(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: klighgrey)),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            right,
            style: GoogleFonts.antonio(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: kwhite,
                    letterSpacing: -0.75)),
          ),
        ],
      ),
    );
  }
}

class Nav_Row extends StatelessWidget {
  final String svg_planet;
  const Nav_Row({Key? key, required this.svg_planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 1.0, color: borderColor),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svg_planet,
                width: 22,
                height: 22,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Text(
                'Mercury'.toUpperCase(),
                style: GoogleFonts.leagueSpartan(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1.36,
                    color: kwhite,
                  ),
                ),
              )),
              const Icon(
                Icons.keyboard_arrow_right_sharp,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
