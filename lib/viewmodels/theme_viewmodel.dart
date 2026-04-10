import 'package:flutter/material.dart';

class ThemeViewModel extends ChangeNotifier {
  bool isDark = false;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }

  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
}
