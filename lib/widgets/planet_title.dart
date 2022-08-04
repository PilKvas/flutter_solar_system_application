import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/planets/planet_screen.dart';

class PlanetTitle extends StatelessWidget {
  const PlanetTitle({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final PlanetScreen widget;

  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data.title,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
