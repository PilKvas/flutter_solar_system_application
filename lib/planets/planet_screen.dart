import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/widgets/button_bar.dart';
import 'package:flutter_solar_system_application/widgets/planet_main_info.dart';
import 'package:flutter_solar_system_application/widgets/planet_title.dart';
import 'package:flutter_solar_system_application/widgets/state_provider.dart';
import 'package:flutter_solar_system_application/widgets/source_wikipedia.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';
import 'package:flutter_solar_system_application/widgets/planet_info.dart';
import 'package:flutter_solar_system_application/widgets/planet_shell.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

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

  String get mainInfo {
    switch (currentTab) {
      case TabState.overview:
        return widget.data.overview.info;
      case TabState.structure:
        return widget.data.structure.info;
      case TabState.surface:
        return widget.data.surface.info;
    }
  }

  String get mainSvgAsset {
    switch (currentTab) {
      case TabState.overview:
        return widget.data.overview.asset;
      case TabState.structure:
        return widget.data.structure.asset;
      case TabState.surface:
        return widget.data.overview.asset;
    }
  }

  Uri get mainUrl {
    switch (currentTab) {
      case TabState.overview:
        return widget.data.overview.url;
      case TabState.structure:
        return widget.data.structure.url;
      case TabState.surface:
        return widget.data.surface.url;
    }
  }

  @override
  Widget build(BuildContext context) {
    currentTab = Provider.of<PlanetProvider>(context).currentTab;
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
                child: ButtonBarWidget(
                    buttonBackgroundColor: widget.buttonBackgroundColor),
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
                    Column(
                      children: [
                        PlanetTitle(
                          widget: widget,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        PlanetMainInfo(
                          mainInfo: mainInfo,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    WikipediaWidget(mainUrl: mainUrl),
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
