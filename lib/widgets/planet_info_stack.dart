import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/widgets/planet_info.dart';



/* Gервая попытка декомпозиции. Выделил блок с информацией о планетах */ 

class PlanetInfoStack extends StatelessWidget {
  const PlanetInfoStack({
    Key? key,
    required this.borderInfoColor,
  }) : super(key: key);

  final Color borderInfoColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlanetInfo(
          leftSideText: 'ROTATION TIME',
          rightSideText: '58.6 DAYS',
          borderInfoColor: borderInfoColor,
        ),
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
    );
  }
}
