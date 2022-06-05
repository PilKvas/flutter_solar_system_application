import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        color: AppColors.background,
        width: double.infinity,
        height: size.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              "assets/background-stars.svg",
              fit: BoxFit.cover,
            ),
            child,
          ],
        ));
  }
}
