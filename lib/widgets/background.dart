import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/* Ответственность за статический фон приложения, является корневым для тела приложения*/

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
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
