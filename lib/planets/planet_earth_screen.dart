import "package:flutter/material.dart";
import 'package:flutter_solar_system_application/configuration/app_assets.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/widgets/common_screen.dart';
import 'package:flutter_solar_system_application/widgets/planet_info_block.dart';
import 'package:flutter_svg/flutter_svg.dart';

/* Является 'строительныи лесом' где расположены все собственноручно написанные виджеты , ответственность за функциональную часть кнопок, скролл, хранит в себе все переменные виджетов, обработка нажатий по кнопкам, отображение данных плаенты Земля, Логика отображения, Стилизация*/

class PlanetEarthScreen extends StatefulWidget {
  const PlanetEarthScreen({Key? key}) : super(key: key);

  @override
  _PlanetEarthScreenState createState() => _PlanetEarthScreenState();
}

class _PlanetEarthScreenState extends State<PlanetEarthScreen> {
  String mainInfo = AppAssets.earthMainInfoOverview;

  String mainSvgAsset = AppAssets.earthOverviewAsset;

  final String secondarySvgAsset = AppAssets.earthSurfaceAsset;

  final Color buttonBackgroundColor = AppColors.earthColor;

  final Color borderInfoColor = AppColors.earthColor;

  final String mainTitle = AppAssets.earthTitle;

  static const Size mainSizeSvgAsset = Size.square(173);

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
    return CommonScreen(
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
                      onPressed: overviewButton,
                      style: isActiveOverview
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      child: Text(
                        'OVERVIEW',
                        style: isActiveOverview
                            ? Theme.of(context).textTheme.headline5?.copyWith(
                                  color: AppColors.white,
                                )
                            : Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    TextButton(
                      style: isActiveStructure
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      onPressed: structureButton,
                      child: Text(
                        'STRUCTURE',
                        style: isActiveStructure
                            ? Theme.of(context).textTheme.headline5?.copyWith(
                                  color: AppColors.white,
                                )
                            : Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    TextButton(
                      style: isActiveSurface
                          ? Theme.of(context).textButtonTheme.style?.copyWith(
                              backgroundColor: MaterialStateProperty.all(
                                  buttonBackgroundColor))
                          : Theme.of(context).textButtonTheme.style,
                      onPressed: surfaceButton,
                      child: Text(
                        'SURFACE',
                        style: isActiveSurface
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
                    Text(
                      mainTitle,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      mainInfo,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    PlanetInfoBlock(borderInfoColor: borderInfoColor),
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
