import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_assets.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/widgets/background.dart';
import 'package:flutter_solar_system_application/widgets/drawer_navigation.dart';
import 'package:flutter_solar_system_application/widgets/planet_info.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanetSaturnScreen extends StatefulWidget {
  const PlanetSaturnScreen({Key? key}) : super(key: key);

  @override
  _PlanetSaturnScreenState createState() => _PlanetSaturnScreenState();
}

class _PlanetSaturnScreenState extends State<PlanetSaturnScreen> {
  String mainInfo = AppAssets.saturnMainInfoOverview;

  String mainSvgAsset = AppAssets.saturnOverviewAsset;

  final String secondarySvgAsset = AppAssets.saturnSurfaceAsset;

  final Color buttonBackgroundColor = AppColors.saturnColor;

  final Color borderInfoColor = AppColors.saturnColor;

  final String mainTitle = AppAssets.saturnTitle;

  static const Size mainSizeSvgAsset = Size.square(211);

  bool isActiveOverview = true;

  bool isActiveStructure = false;

  bool isActiveSurface = false;

  void overviewButton() {
    setState(() {
      mainSvgAsset = AppAssets.earthOverviewAsset;
      mainInfo = AppAssets.earthMainInfoOverview;
      isActiveOverview = true;
      isActiveStructure = false;
      isActiveSurface = false;
    });
  }

  void structureButton() {
    setState(() {
      mainSvgAsset = AppAssets.earthStructureAsset;
      mainInfo = AppAssets.earthMainInfoStructure;
      isActiveOverview = false;
      isActiveStructure = true;
      isActiveSurface = false;
    });
  }

  void surfaceButton() {
    setState(() {
      mainSvgAsset = AppAssets.earthOverviewAsset;
      mainInfo = AppAssets.earthMainInfoSurface;
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
                              ? MaterialStateProperty.all(buttonBackgroundColor)
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
                          rightSideText: '58.6 DAYS',
                          borderInfoColor: borderInfoColor),
                      PlanetInfo(
                        leftSideText: 'REVOLUTION TIME',
                        rightSideText: '87.97 DAYS',
                        borderInfoColor: borderInfoColor,
                      ),
                      PlanetInfo(
                        leftSideText: 'RADIUS',
                        rightSideText: '2,439.7 KM',
                        borderInfoColor: borderInfoColor,
                      ),
                      PlanetInfo(
                        leftSideText: 'AVERAGE TEMP.',
                        rightSideText: '430°C',
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
