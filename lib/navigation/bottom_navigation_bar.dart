import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/bottom_navigation_screens/add_memories_screen.dart';
import '../screens/bottom_navigation_screens/search_screen.dart';
import '../screens/bottom_navigation_screens/explore_screen.dart';
import '../screens/bottom_navigation_screens/profile_screen.dart';
import '../screens/bottom_navigation_screens/trips_screen.dart';

import 'bottom_navigation_state.dart';

class MMKBottomNavigationBar extends StatelessWidget {
  static const String routeName = '/bottom-navigation-bar';

  final Widget exploreIcon = SvgPicture.asset(
    "assets/icons/bottomExplore.svg",
    color: Colors.black,
    height: 23,
  );

  final Widget searchIcon = SvgPicture.asset(
    "assets/icons/bottomSearch.svg",
    color: Colors.black,
    height: 23,
  );

  final Widget addIcon = SvgPicture.asset(
    "assets/icons/bottomAdd.svg",
    color: Colors.black,
    height: 23,
  );

  final Widget bookedIcon = SvgPicture.asset(
    "assets/icons/bottomBooked.svg",
    color: Colors.black,
    height: 23,
  );

  final Widget profileIcon = SvgPicture.asset(
    "assets/icons/bottomProfile.svg",
    color: Colors.black,
    height: 23,
  );

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
      'page': AddMemoriesScreen(),
      'title': 'Add Memory',
    },
    {
      'page': TripsScreen(),
      'title': 'Trips',
    },
    {
      'page': MeScreen(),
      'title': 'Profile',
    }
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavigationState state = Provider.of<BottomNavigationState>(context);
    int _selectedPageIndex = state.getSelectedPageIndex;
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: (index) => state.setSelectedPageIndex(index),
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.all(15),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
              ),
              child: exploreIcon,
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: exploreIcon,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.all(15),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
              ),
              child: searchIcon,
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: searchIcon,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.all(15),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
              ),
              child: addIcon,
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: addIcon,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.all(15),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
              ),
              child: bookedIcon,
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: bookedIcon,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              padding: EdgeInsets.all(15),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 3,
                  ),
                ),
              ),
              child: profileIcon,
            ),
            icon: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: profileIcon,
            ),
            title: Container(),
          ),
        ],
      ),
    );
  }
}
