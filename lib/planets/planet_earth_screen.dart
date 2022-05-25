import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configurations.dart';
import 'package:flutter_solar_system_application/widgets/background.dart';
import 'package:flutter_solar_system_application/widgets/drawer_navigation.dart';
import 'package:flutter_solar_system_application/widgets/planet_info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetEarthScreen extends StatefulWidget {
  const PlanetEarthScreen({Key? key}) : super(key: key);

  @override
  _PlanetEarthScreenState createState() => _PlanetEarthScreenState();
}

class _PlanetEarthScreenState extends State<PlanetEarthScreen> {

  String mainInfo = AppComponents.earthMainInfoOverview;

  String mainSvgAsset = AppComponents.earthOverviewAsset;

  final String secondarySvgAsset = AppComponents.earthSurfaceAsset;

  final Color buttonBackgroundColor = AppColors.earthColor;

  final Color borderInfoColor = AppColors.earthColor;

  final  String mainTitle = AppComponents.earthTitle;

  static const Size mainSizeSvgAsset = Size.square(173);

  bool isActiveOverview = true;

  bool isActiveStructure = false;

  bool isActiveSurface = false;

  void overviewButton() {
    setState(() {
      mainSvgAsset = AppComponents.earthOverviewAsset;
      mainInfo = AppComponents.earthMainInfoOverview;
      isActiveOverview = true;
      isActiveStructure = false;
      isActiveSurface = false;
    });
  }

  void structureButton() {
    setState(() {
      mainSvgAsset = AppComponents.earthStructureAsset;
      mainInfo = AppComponents.earthMainInfoStructure;
      isActiveOverview = false;
      isActiveStructure = true;
      isActiveSurface = false;
    });
  }

   void surfaceButton() {
    setState(() {
      mainSvgAsset = AppComponents.earthOverviewAsset;
      mainInfo = AppComponents.earthMainInfoSurface;
      isActiveOverview = false;
      isActiveStructure = false;
      isActiveSurface = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerNavigation(),
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'THE PLANETS',
          style: GoogleFonts.antonio(
              textStyle: const TextStyle(
                  color: AppColors.kwhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                  letterSpacing: -1.05)),
        ),
      ),
      body: Background(
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: AppColors.borderColor),
                        top: BorderSide(color: AppColors.borderColor)),
                  ),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: overviewButton,
                        style: ButtonStyle(
                          backgroundColor: isActiveOverview
                              ? MaterialStateProperty.all(buttonBackgroundColor)
                              : MaterialStateProperty.all(null),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10.0)),
                        ),
                        child: Text('OVERVIEW',
                            style: GoogleFonts.leagueSpartan(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                letterSpacing: 1.96,
                                color: isActiveOverview
                                    ? AppColors.kwhite
                                    : AppColors.klighgrey,
                              ),
                            )),
                      ),
                      TextButton(
                          style: ButtonStyle(
                            backgroundColor: isActiveStructure
                                ? MaterialStateProperty.all(
                                  buttonBackgroundColor)
                                : MaterialStateProperty.all(null),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(10.0)),
                          ),
                          onPressed: structureButton,
                          child: Text(
                            'STRUCTURE',
                            style: GoogleFonts.leagueSpartan(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                letterSpacing: 1.96,
                                color: isActiveStructure
                                    ? AppColors.kwhite
                                    : AppColors.klighgrey,
                              ),
                            ),
                          )),
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor: isActiveSurface
                                ? MaterialStateProperty.all(
                                    buttonBackgroundColor)
                                : MaterialStateProperty.all(null),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(10.0)),
                        ),
                        onPressed: surfaceButton,
                        child: Text(
                          'SURFACE',
                          style: GoogleFonts.leagueSpartan(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                                letterSpacing: 1.96,
                                color: isActiveSurface
                                    ? AppColors.kwhite
                                    : AppColors.klighgrey,
                              ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 65,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SvgPicture.asset(
                            mainSvgAsset,
                            width: mainSizeSvgAsset.width,
                            height: mainSizeSvgAsset.height,
                          ),
                          Opacity(
                            opacity: isActiveSurface ? 1 : 0,
                            child: Image.asset(
                              secondarySvgAsset,
                              width: mainSizeSvgAsset.width,
                              height: mainSizeSvgAsset.height,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 90,
                      ),
                      Text(mainTitle,
                          style: GoogleFonts.antonio(
                            textStyle: const TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: AppColors.kwhite),
                          )),
                      const SizedBox(height: 40),
                      Text(mainInfo,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.leagueSpartan(
                            textStyle: const TextStyle(
                                fontSize: 17,
                                color: AppColors.kwhiteBody,
                                fontWeight: FontWeight.w300,
                                height: 1.3),
                          )),
                      const SizedBox(
                        height: 40,
                      ),
                       PlanetInfo(
                          leftSideText: 'ROTATION TIME',
                          rightSideText: AppComponents.earthRotationTime,
                          borderInfoColor: borderInfoColor),
                       PlanetInfo(
                        leftSideText: 'REVOLUTION TIME',
                        rightSideText: AppComponents.earthRevolution,
                        borderInfoColor: borderInfoColor,
                      ),
                       PlanetInfo(
                          leftSideText: 'RADIUS',
                           rightSideText: AppComponents.earthRadius,
                           borderInfoColor: borderInfoColor,
                      ),
                       PlanetInfo(
                          leftSideText: 'AVERAGE TEMP.',
                          rightSideText: AppComponents.earthTemperature,
                          borderInfoColor: borderInfoColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
