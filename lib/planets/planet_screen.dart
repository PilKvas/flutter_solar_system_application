import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';
import 'package:flutter_solar_system_application/widgets/planet_info.dart';
import 'package:flutter_solar_system_application/widgets/planet_shell.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:url_launcher/url_launcher.dart';

enum _TabState {
  overview,
  structure,
  surface,
}

class PlanetScreen extends StatefulWidget {
  const PlanetScreen(
      {Key? key,
      required this.data,
      required this.buttonBackgroundColor,
      required this.borderInfoColor})
      : super(key: key);

  final PlanetData data;

  final Color buttonBackgroundColor;

  final Color borderInfoColor;

  @override
  State<PlanetScreen> createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {
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
        return widget.data.overview.asset;
    }
  }

  // Uri get _mainUrl{
  //   switch (_currentTab) {
  //     case _TabState.overview:
  //       return widget.data.overview.url;
  //     case _TabState.structure:
  //       return widget.data.structure.url;
  //     case _TabState.surface:
  //       return widget.data.surface.url;
  //   }
  // }
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
    return PlanetShell(
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
                      style: _currentTab == _TabState.overview
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  widget.buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'OVERVIEW',
                        style: _currentTab == _TabState.overview
                            ? Theme.of(context).textTheme.headline5?.copyWith(
                                  color: AppColors.white,
                                )
                            : Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    TextButton(
                      style: _currentTab == _TabState.structure
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  widget.buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      onPressed: onStructurePressed,
                      child: Text(
                        'STRUCTURE',
                        style: _currentTab == _TabState.structure
                            ? Theme.of(context).textTheme.headline5?.copyWith(
                                  color: AppColors.white,
                                )
                            : Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    TextButton(
                      style: _currentTab == _TabState.surface
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  widget.buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      onPressed: onSurfacePressed,
                      child: Text(
                        'SURFACE',
                        style: _currentTab == _TabState.surface
                            ? Theme.of(context).textTheme.headline5?.copyWith(
                                  color: AppColors.white,
                                )
                            : Theme.of(context).textTheme.headline5,
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
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    Text(
                      widget.data.title,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      _mainInfo,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // GestureDetector(
                    //   // onTap: () {
                    //   //   launchUrl(_mainUrl);
                    //   // },
                    //   child: const Text('Source: Wikipedia', style: TextStyle(color: AppColors.white, fontSize: 20))
                    // ),
                    const SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//   void _launchUrl() async {
//   if (!await launchUrl(widget.data.overview.url)) throw 'Could not launch' ;
// }
}
