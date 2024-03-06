import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_solar_system_application/features/planets/bloc/planet_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

/* Ответственность за кнопку навигации, ее оформления и конкретизацию именного роута */

class NavRow extends StatelessWidget {
  const NavRow({
    Key? key,
    required this.route,
    required this.svgPlanetSize,
    required this.planetPlace,
  }) : super(key: key);

  final int planetPlace;
  final String route;
  final Size svgPlanetSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlanetBloc, PlanetState>(
      builder: (context, state) {
        if (state is PlanetLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, route);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        child: SvgPicture.asset(
                          state.planets[planetPlace].images.planet,
                          height: svgPlanetSize.height,
                          width: svgPlanetSize.width,
                        ),
                      )
                          .animate()
                          .scale(duration: const Duration(milliseconds: 550)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        state.planets[planetPlace].name,
                        style: Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
