import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/widgets/source_wikipedia.dart';
import 'package:flutter_solar_system_application/widgets/text_button.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';
import 'package:flutter_solar_system_application/widgets/planet_info.dart';
import 'package:flutter_solar_system_application/widgets/planet_shell.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  TabState currentTab = TabState.overview;

  String get _mainInfo {
    switch (currentTab) {
      case TabState.overview:
        return widget.data.overview.info;
      case TabState.structure:
        return widget.data.structure.info;
      case TabState.surface:
        return widget.data.surface.info;
    }
  }

  String get _mainSvgAsset {
    switch (currentTab) {
      case TabState.overview:
        return widget.data.overview.asset;
      case TabState.structure:
        return widget.data.structure.asset;
      case TabState.surface:
        return widget.data.overview.asset;
    }
  }

  Uri get _mainUrl {
    switch (currentTab) {
      case TabState.overview:
        return widget.data.overview.url;
      case TabState.structure:
        return widget.data.structure.url;
      case TabState.surface:
        return widget.data.surface.url;
    }
  }

  void onOverviewPressed() {
    setState(() {
      currentTab = TabState.overview;
    });
  }

  void onStructurePressed() {
    setState(() {
      currentTab = TabState.structure;
    });
  }

  void onSurfacePressed() {
    setState(() {
      currentTab = TabState.surface;
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
                    TextButtonWdiget(
                      buttontTitle: 'OVERVIEW',
                      onPressed: onOverviewPressed,
                      buttonStyle: currentTab == TabState.overview
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  widget.buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      textStyle: currentTab == TabState.overview
                          ? Theme.of(context).textTheme.headline5?.copyWith(
                                color: AppColors.white,
                              )
                          : Theme.of(context).textTheme.headline5,
                    ),
                    TextButtonWdiget(
                      buttontTitle: 'STRUCTURE',
                      onPressed: onStructurePressed,
                      buttonStyle: currentTab == TabState.structure
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  widget.buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      textStyle: currentTab == TabState.structure
                          ? Theme.of(context).textTheme.headline5?.copyWith(
                                color: AppColors.white,
                              )
                          : Theme.of(context).textTheme.headline5,
                    ),
                    TextButtonWdiget(
                      buttontTitle: 'SURFACE',
                      onPressed: onSurfacePressed,
                      buttonStyle: currentTab == TabState.surface
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  widget.buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      textStyle: currentTab == TabState.surface
                          ? Theme.of(context).textTheme.headline5?.copyWith(
                                color: AppColors.white,
                              )
                          : Theme.of(context).textTheme.headline5,
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
                          width: widget.data.assetSize,
                          height: widget.data.assetSize,
                        ),
                        Opacity(
                          opacity: currentTab == TabState.surface ? 1 : 0,
                          child: Image.asset(
                            widget.data.surface.asset,
                            width: widget.data.assetSize,
                            height: widget.data.assetSize,
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
                      height: 20,
                    ),
                    WikipediaWidget(mainUrl: _mainUrl),
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
}
