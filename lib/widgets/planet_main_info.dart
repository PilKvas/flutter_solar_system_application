import 'package:flutter/material.dart';

class PlanetMainInfo extends StatelessWidget {
  const PlanetMainInfo({
    Key? key,
    required String mainInfo,
  })  : _mainInfo = mainInfo,
        super(key: key);

  final String _mainInfo;

  @override
  Widget build(BuildContext context) {
    return Text(
      _mainInfo,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyText1,
    );
  }
}
