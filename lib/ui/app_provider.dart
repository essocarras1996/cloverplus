import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInfoProvider with ChangeNotifier {
  late ThemeData _themeColor;

  AppInfoProvider(this._themeColor);

  ThemeData get getTheme => _themeColor;

  setTheme(ThemeData themeColor) {
    _themeColor = themeColor;
    notifyListeners();
  }
}