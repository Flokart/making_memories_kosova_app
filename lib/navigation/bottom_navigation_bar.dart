import 'package:flutter/material.dart';
import 'package:mmk/screens/memories_screen.dart';
import 'package:mmk/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:mmk/screens/explore_screen.dart';
import 'package:mmk/screens/me_screen.dart';
import 'package:mmk/screens/trips_screen.dart';

import '../stateManager/bottom_navigation_state.dart';

class MMKBottomNavigationBar extends StatelessWidget {
  final List<Map<String, Object>> _pages = [
    {
      'page': ExploreScreen(),
      'title': 'Explore',
    },
    {
      'page': SearchScreen(),
      'title': 'Search',
    },
    {
      'page': MemoriesScreen(),
      'title': 'Add Memory',
    },
    {
      'page': TripsScreen(),
      'title': 'Trips',
    },
    {
      'page': MeScreen(),
      'title': 'Me',
    }
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavigationState state = Provider.of<BottomNavigationState>(context);
    int _selectedPageIndex = state.getSelectedPageIndex;
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (index) => state.setSelectedPageIndex(index),
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.explore,
              size: 35,
            ),
            icon: Icon(
              Icons.explore,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              size: 35,
            ),
            icon: Icon(
              Icons.search,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 45,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.bookmark_border,
              size: 35,
            ),
            icon: Icon(
              Icons.bookmark_border,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.account_circle,
              size: 35,
            ),
            icon: Icon(
              Icons.account_circle,
            ),
            title: Container(),
          ),
        ],
      ),
    );
  }
}
