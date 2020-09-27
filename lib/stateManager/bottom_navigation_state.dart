import 'package:flutter/material.dart';

class BottomNavigationState with ChangeNotifier{
  int _selectedPageIndex = 0;

  get getSelectedPageIndex{
    return _selectedPageIndex;
  }

  void setSelectedPageIndex(int i){
    _selectedPageIndex = i;
    notifyListeners();
  }

}