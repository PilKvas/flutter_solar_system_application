import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/features/planets/view/view.dart';
import 'package:flutter_solar_system_application/features/planets/widgets/widgets.dart';
import 'package:flutter_solar_system_application/features/space_images.dart/view/space_images.dart';
import 'package:flutter_solar_system_application/theme/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DrawerNavigation(),
    SpaceImagesList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.background,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/solar-system (6).png',
              width: 30,
              height: 30,
            ),
            label: 'PLANETS',
          ),
          BottomNavigationBarItem(
            icon:Image.asset(
              'assets/galaxy.png',
              width: 30,
              height: 30,
            ),
            label: 'SPACE',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Сериалы',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
