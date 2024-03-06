import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

/* Ответственность за статический фон приложения, является корневым для тела приложения*/

class Background extends StatelessWidget {
  const Background({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            "assets/background-stars.svg",
            fit: BoxFit.cover,
          ),
          child,
        ],
      ),
    );
  }
}
