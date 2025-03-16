import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool darkmode;
  

  ThemeProvider({
    this.darkmode = true,
  });

  void ChangeMode() {
    darkmode = !darkmode;
    notifyListeners();
  }
}
