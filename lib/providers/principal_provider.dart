import 'package:flutter/material.dart';
import '../pages/principal/screens/home_screen.dart';
import '../pages/principal/screens/preferites_screen.dart';
import '../pages/principal/screens/search_screen.dart';

class PrincipalProvider extends ChangeNotifier {

  final List<Widget> _principalScreens = [
    HomeScreen(),
    PreferitesScreen(),
    SearchScreen(),
  ];

  int menuIndex = 0;
  Widget principalScreenBody = HomeScreen();


  void onClickNavigationButton(int index) {
    menuIndex = index;
    principalScreenBody = _principalScreens[index];
    notifyListeners();
  }
}