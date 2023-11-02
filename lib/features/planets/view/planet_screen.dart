import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_solar_system_application/features/planets/bloc/planet_bloc.dart';
import 'package:flutter_solar_system_application/features/planets/widgets/widgets.dart';
import 'package:flutter_solar_system_application/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum TabState {
  overview,
  structure,
  surface,
}

class PlanetScreen extends StatefulWidget {
  const PlanetScreen({
    Key? key,
    required this.planetPlace,
    required this.planetColor,
  }) : super(key: key);

  final Color planetColor;
  final int planetPlace;

  @override
  State<PlanetScreen> createState() => _PlanetScreenState();
}

class _PlanetScreenState extends State<PlanetScreen> {
  static const Size mainSizeSvgAsset = Size.square(173);

  @override
  void initState() {
    context.read<PlanetBloc>().add(
          PlanetLoadData(
            planetPlace: widget.planetPlace,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanetBloc, PlanetState>(
      builder: (context, state) {
        if (state is PlanetLoaded) {
          return PlanetShell(
            body: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
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
                            onPressed: () {
                              context.read<PlanetBloc>().add(
                                    OverviewTabSelect(
                                        planet: state.planets,
                                        planetPlace: widget.planetPlace),
                                  );
                            },
                            style: state.tabState == TabState.overview
                                ? Theme.of(context)
                                    .textButtonTheme
                                    .style
                                    ?.copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                      widget.planetColor,
                                    ))
                                : Theme.of(context).textButtonTheme.style,
                            child: Text(
                              'OVERVIEW',
                              style: state.tabState == TabState.overview
                                  ? Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: AppColors.white,
                                      )
                                  : Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          TextButton(
                            style: state.tabState == TabState.structure
                                ? Theme.of(context)
                                    .textButtonTheme
                                    .style
                                    ?.copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                      widget.planetColor,
                                    ))
                                : Theme.of(context).textButtonTheme.style,
                            onPressed: () {
                              context.read<PlanetBloc>().add(
                                    StructureTabSelect(
                                        planet: state.planets,
                                        planetPlace: widget.planetPlace),
                                  );
                            },
                            child: Text(
                              'STRUCTURE',
                              style: state.tabState == TabState.structure
                                  ? Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: AppColors.white,
                                      )
                                  : Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                          TextButton(
                            style: state.tabState == TabState.surface
                                ? Theme.of(context)
                                    .textButtonTheme
                                    .style
                                    ?.copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                      widget.planetColor,
                                    ))
                                : Theme.of(context).textButtonTheme.style,
                            onPressed: () {
                              context.read<PlanetBloc>().add(SurfaceTabSelect(
                                    planet: state.planets,
                                    planetPlace: widget.planetPlace,
                                  ));
                            },
                            child: Text(
                              'SURFACE',
                              style: state.tabState == TabState.surface
                                  ? Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: AppColors.white,
                                      )
                                  : Theme.of(context).textTheme.labelSmall,
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
                            alignment: Alignment.bottomCenter,
                            children: [
                              SvgPicture.asset(
                                state.mainSvg ?? "Ошибка",
                                width: mainSizeSvgAsset.width,
                                height: mainSizeSvgAsset.height,
                              ),
                              Opacity(
                                opacity:
                                    state.tabState == TabState.surface ? 1 : 0,
                                child: Image.asset(
                                  state.planets[widget.planetPlace].images
                                      .geology,
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
                            state.planets[widget.planetPlace].name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 40),
                          Text(
                            state.mainInfo ?? "Ошибка",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              PlanetInfo(
                                leftSideText: 'ROTATION TIME',
                                rightSideText:
                                    state.planets[widget.planetPlace].rotation,
                                borderInfoColor: widget.planetColor,
                              ),
                              PlanetInfo(
                                leftSideText: 'REVOLUTION TIME',
                                rightSideText: state
                                    .planets[widget.planetPlace].revolution,
                                borderInfoColor: widget.planetColor,
                              ),
                              PlanetInfo(
                                leftSideText: 'RADIUS',
                                rightSideText:
                                    state.planets[widget.planetPlace].radius,
                                borderInfoColor: widget.planetColor,
                              ),
                              PlanetInfo(
                                leftSideText: 'AVERAGE TEMP.',
                                rightSideText: state
                                    .planets[widget.planetPlace].temperature,
                                borderInfoColor: widget.planetColor,
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
        } else if (state is PlanetLoading) {
          return const Background(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PlanetError) {
          return Background(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Something went wrong',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Try again later",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
