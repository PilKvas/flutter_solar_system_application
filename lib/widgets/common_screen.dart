import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/widgets/app_bar.dart';
import 'package:flutter_solar_system_application/widgets/background.dart';
import 'package:flutter_solar_system_application/widgets/drawer_navigation.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({Key? key, required this.body}) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerNavigation(),
      appBar: AppBarWidget(),
      body: Background(
        child: body,
      ),
    );
  }
}
