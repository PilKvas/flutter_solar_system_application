import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/features/planets/widgets/widgets.dart';

class PlanetShell extends StatelessWidget {
  const PlanetShell({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Solar System',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Background(
        child: body,
      ),
    );
  }
}
