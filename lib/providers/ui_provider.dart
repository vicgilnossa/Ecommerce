import 'package:flutter/widgets.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;
  int get selectedMenuOption {
    return _selectedMenuOpt;
  }

  set selectedMenuOpt(int i) {
    _selectedMenuOpt = i;
    notifyListeners();
  }
}
