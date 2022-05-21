import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configurations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// Лучше разделять переиспользумые виджеты на разные файлы, чтобы было легче
// искать. Даже в среднем приложении размер такого файла улетит на несколько
// тысяч строк

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Лучше не игнорировать то, что пишет линтер. Линтер на ранних этапах
    // может подсказать лучшие практики. Тут, например, он подсказал, что
    // виджет Container в данном случае - оверкилл. Можно использовать обычный
    // SizedBox
    return SizedBox(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                // Такие шутки лучше кидать в константы
                "assets/background-stars.svg",
                fit: BoxFit.cover,
              ),
            ),
            child,
          ],
        ));
  }
}

// Опять-таки, обращай внимание на то, что тебе пишет линтер. Чем меньше
// игноров - тем лучше. Здесь было от него полезное напоминание. В дарте
// принято использовать CamelCase.
//
// Советую полезную статью с оф. сайта: https://dart.dev/guides/language/effective-dart/style
//
// Переименовал в PlanetInfo
class PlanetInfo extends StatelessWidget {
  // Лучше давать более подробные имена полям класса. В случае с этими
  // было бы лучше назвать `leftSideText` и `rightSideText`
  final String left;
  final String right;
  const PlanetInfo({Key? key, required this.left, required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(border: Border.all(color: mercuryColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            left,
            style: GoogleFonts.leagueSpartan(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: klighgrey)),
          ),
          // Здесь можно было использовать виджет Spacer
          const Expanded(
            child: SizedBox(),
          ),
          Text(
            right,
            style: GoogleFonts.antonio(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 25,
                    color: kwhite,
                    letterSpacing: -0.75)),
          ),
        ],
      ),
    );
  }
}

// Снова отсылаю к документации Дарта по поводу кодинг стайла
//
// `NavRow` - корректнее
class Nav_Row extends StatelessWidget {
  static const Size svgPlanetSize = Size.square(22);

  // Тут тоже кодинг стайл. Лучше называть поле `planetSvgAsset`
  final String svg_planet;
  const Nav_Row({Key? key, required this.svg_planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 1.0, color: borderColor),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svg_planet,
                // Хорошая практика - заносить такие параметры в константы
                //
                // Потом, если вернешься ещё к этому коду, будет легче
                // исправлять значения
                width: svgPlanetSize.width,
                height: svgPlanetSize.height,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Text(
                    // Такие значения лучше хранить в отдельном файле с
                    // константами
                'Mercury'.toUpperCase(),
                style: GoogleFonts.leagueSpartan(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1.36,
                    color: kwhite,
                  ),
                ),
              )),
              const Icon(
                Icons.keyboard_arrow_right_sharp,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
