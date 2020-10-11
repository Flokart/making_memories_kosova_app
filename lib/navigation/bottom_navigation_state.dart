import 'package:flutter/material.dart';

class BottomNavigationState with ChangeNotifier {
  int _selectedPageIndex = 0;
  bool _booked = false;
  bool _saved = false;

  get getSelectedPageIndex {
    return _selectedPageIndex;
  }

  void setSelectedPageIndex(int i) {
    _selectedPageIndex = i;
    notifyListeners();
  }

  get getBooked {
    return _booked;
  }

  void setBooked(bool i) {
    _booked = i;
    notifyListeners();
  }

  get getSaved {
    return _saved;
  }

  void setSaved(bool i) {
    _saved = i;
    notifyListeners();
  }
}
