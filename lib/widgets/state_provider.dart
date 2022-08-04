import 'package:flutter/material.dart';
import 'package:flutter_solar_system_application/widgets/planet_data.dart';

class PlanetProvider extends ChangeNotifier {
  TabState currentTab;

  PlanetProvider({
    this.currentTab = TabState.overview,
  });

  void changeCurrenTab(TabState newTab) {
    currentTab = newTab;
    notifyListeners();
  }
}
