import 'package:flutter/material.dart';

class LanguageViewModel extends ChangeNotifier {
  String lang = "en";

  void setLang(String l) {
    lang = l;
    notifyListeners();
  }
}
