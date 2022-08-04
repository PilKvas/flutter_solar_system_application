import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';
import 'package:flutter_solar_system_application/widgets/state_provider.dart';
import 'package:flutter_solar_system_application/widgets/text_button.dart';
import 'package:provider/provider.dart';

class ButtonBarWidget extends StatefulWidget {
  final Color? buttonBackgroundColor;
  const ButtonBarWidget({Key? key, required this.buttonBackgroundColor})
      : super(key: key);

  @override
  _ButtonBarWidgetState createState() => _ButtonBarWidgetState();
}

class _ButtonBarWidgetState extends State<ButtonBarWidget> {
  @override
  Widget build(BuildContext context) {
    TabState currentTab = Provider.of<PlanetProvider>(context).currentTab;
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButtonWidget(
          buttontTitle: 'OVERVIEW',
          onPressed: () {
            Provider.of<PlanetProvider>(context, listen: false)
                .changeCurrenTab(currentTab = TabState.overview);
          },
          buttonStyle: currentTab == TabState.overview
              ? Theme.of(context).textButtonTheme.style?.copyWith(
                  backgroundColor:
                      MaterialStateProperty.all(widget.buttonBackgroundColor))
              : Theme.of(context).textButtonTheme.style,
          textStyle: currentTab == TabState.overview
              ? Theme.of(context).textTheme.headline5?.copyWith(
                    color: AppColors.white,
                  )
              : Theme.of(context).textTheme.headline5,
        ),
        TextButtonWidget(
          buttontTitle: 'STRUCTURE',
          onPressed: () {
            Provider.of<PlanetProvider>(context, listen: false)
                .changeCurrenTab(currentTab = TabState.structure);
          },
          buttonStyle: currentTab == TabState.structure
              ? Theme.of(context).textButtonTheme.style?.copyWith(
                  backgroundColor:
                      MaterialStateProperty.all(widget.buttonBackgroundColor))
              : Theme.of(context).textButtonTheme.style,
          textStyle: currentTab == TabState.structure
              ? Theme.of(context).textTheme.headline5?.copyWith(
                    color: AppColors.white,
                  )
              : Theme.of(context).textTheme.headline5,
        ),
        TextButtonWidget(
          buttontTitle: 'SURFACE',
          onPressed: () {
            Provider.of<PlanetProvider>(context, listen: false)
                .changeCurrenTab(currentTab = TabState.surface);
          },
          buttonStyle: currentTab == TabState.surface
              ? Theme.of(context).textButtonTheme.style?.copyWith(
                  backgroundColor:
                      MaterialStateProperty.all(widget.buttonBackgroundColor))
              : Theme.of(context).textButtonTheme.style,
          textStyle: currentTab == TabState.surface
              ? Theme.of(context).textTheme.headline5?.copyWith(
                    color: AppColors.white,
                  )
              : Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
