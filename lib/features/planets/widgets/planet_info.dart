import 'package:flutter/material.dart';

/* Класс PlanetInfo отвечает за отображение строки с информацией о планетах, хранит свойства отвечающие за информацию */

class PlanetInfo extends StatelessWidget {
  final Color borderInfoColor;
  final String leftSideText;
  final String rightSideText;

  const PlanetInfo(
      {Key? key,
      required this.leftSideText,
      required this.rightSideText,
      required this.borderInfoColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(border: Border.all(color: borderInfoColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            leftSideText,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            rightSideText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
