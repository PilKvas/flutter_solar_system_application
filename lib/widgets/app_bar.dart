import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/configuration/app_colors.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  AppBarWidget({
    this.appTitle = 'THE PLANETS',
    Key? key,
  }) : super(key: key);

  final String appTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      title: Text(
        appTitle,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
