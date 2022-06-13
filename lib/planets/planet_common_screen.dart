import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/widgets/planet_scaffold.dart';
import 'package:flutter_solar_system_application/widgets/planet_info.dart';

/// Таким enum можно заменить твою структуру:
///
/// ```
/// bool isActiveOverview = true;
///
///  bool isActiveStructure = false;
///
///  bool isActiveSurface = false;
/// ```
enum _TabState {
  overview,
  structure,
  surface;
}

/// Это данные для твоих `mainInfo` или `mainInfoAsset`.
class PlanetInfoData {
  final String info;
  final String asset;

  PlanetInfoData({
    required this.info,
    required this.asset,
  });
}

/// Это данные для всего экрана.
class PlanetData {
  final String title;

  final PlanetInfoData overview;
  final PlanetInfoData structure;
  final PlanetInfoData surface;

  final String rotationTime;
  final String revolutionTime;
  final String radius;
  final String averageTemperature;

  PlanetData({
    required this.title,
    required this.overview,
    required this.structure,
    required this.surface,
    required this.rotationTime,
    required this.revolutionTime,
    required this.radius,
    required this.averageTemperature,
  });
}

class PlanetCommonScreen extends StatefulWidget {
  const PlanetCommonScreen({
    Key? key,
    required this.data,
    required this.buttonBackgroundColor,
    required this.borderInfoColor,
  }) : super(key: key);

  final PlanetData data;

  final Color buttonBackgroundColor;

  final Color borderInfoColor;

  @override
  _PlanetCommonScreenState createState() => _PlanetCommonScreenState();
}

class _PlanetCommonScreenState extends State<PlanetCommonScreen> {
  static const Size mainSizeSvgAsset = Size.square(173);

  _TabState _currentTab = _TabState.overview;

  String get _mainInfo {
    switch (_currentTab) {
      case _TabState.overview:
        return widget.data.overview.info;
      case _TabState.structure:
        return widget.data.structure.info;
      case _TabState.surface:
        return widget.data.surface.info;
    }
  }

  String get _mainSvgAsset {
    switch (_currentTab) {
      case _TabState.overview:
        return widget.data.overview.asset;
      case _TabState.structure:
        return widget.data.structure.asset;
      case _TabState.surface:
        return widget.data.surface.asset;
    }
  }

  void onOverviewPressed() {
    setState(() {
      _currentTab = _TabState.overview;
    });
  }

  void onStructurePressed() {
    setState(() {
      _currentTab = _TabState.structure;
    });
  }

  void onSurfacePressed() {
    setState(() {
      _currentTab = _TabState.surface;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlanetScaffold(
      body: SingleChildScrollView(
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
                      onPressed: onOverviewPressed,
                      style: ButtonStyle(
                        backgroundColor: _currentTab == _TabState.overview
                            ? MaterialStateProperty.all(
                                widget.buttonBackgroundColor)
                            : MaterialStateProperty.all(null),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10.0)),
                      ),
                      child: Text(
                        'OVERVIEW',
                        style: GoogleFonts.leagueSpartan(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                            letterSpacing: 1.96,
                            color: _currentTab == _TabState.overview
                                ? AppColors.white
                                : AppColors.lightGrey,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor: _currentTab == _TabState.structure
                              ? MaterialStateProperty.all(
                                  widget.buttonBackgroundColor)
                              : MaterialStateProperty.all(null),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10.0)),
                        ),
                        onPressed: onStructurePressed,
                        child: Text(
                          'STRUCTURE',
                          style: GoogleFonts.leagueSpartan(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 11,
                              letterSpacing: 1.96,
                              color: _currentTab == _TabState.structure
                                  ? AppColors.white
                                  : AppColors.lightGrey,
                            ),
                          ),
                        )),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: _currentTab == _TabState.surface
                            ? MaterialStateProperty.all(
                                widget.buttonBackgroundColor)
                            : MaterialStateProperty.all(null),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.all(10.0)),
                      ),
                      onPressed: onSurfacePressed,
                      child: Text(
                        'SURFACE',
                        style: GoogleFonts.leagueSpartan(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 11,
                            letterSpacing: 1.96,
                            color: _currentTab == _TabState.surface
                                ? AppColors.white
                                : AppColors.lightGrey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 65),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          _mainSvgAsset,
                          width: mainSizeSvgAsset.width,
                          height: mainSizeSvgAsset.height,
                        ),
                        Opacity(
                          opacity: _currentTab == _TabState.surface ? 1 : 0,
                          child: Image.asset(
                            widget.data.surface.asset,
                            width: mainSizeSvgAsset.width,
                            height: mainSizeSvgAsset.height,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 90),
                    Text(
                      widget.data.title,
                      style: GoogleFonts.antonio(
                        textStyle: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      _mainInfo,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        textStyle: const TextStyle(
                          fontSize: 17,
                          color: AppColors.whiteBody,
                          fontWeight: FontWeight.w300,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    PlanetInfo(
                      leftSideText: 'ROTATION TIME',
                      rightSideText: widget.data.rotationTime,
                      borderInfoColor: widget.borderInfoColor,
                    ),
                    PlanetInfo(
                      leftSideText: 'REVOLUTION TIME',
                      rightSideText: widget.data.revolutionTime,
                      borderInfoColor: widget.borderInfoColor,
                    ),
                    PlanetInfo(
                      leftSideText: 'RADIUS',
                      rightSideText: widget.data.radius,
                      borderInfoColor: widget.borderInfoColor,
                    ),
                    PlanetInfo(
                      leftSideText: 'AVERAGE TEMP.',
                      rightSideText: widget.data.averageTemperature,
                      borderInfoColor: widget.borderInfoColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
