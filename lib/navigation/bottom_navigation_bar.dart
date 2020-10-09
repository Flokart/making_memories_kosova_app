import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/bottom_navigation_screens/add_memories_screen.dart';
import '../screens/bottom_navigation_screens/search_screen.dart';
import '../screens/bottom_navigation_screens/explore_screen.dart';
import '../screens/bottom_navigation_screens/me_screen.dart';
import '../screens/bottom_navigation_screens/trips_screen.dart';

import 'bottom_navigation_state.dart';

class MMKBottomNavigationBar extends StatelessWidget {
  static const String routeName = '/bottom-navigation-bar';


  final Widget exploreIcon = SvgPicture.asset(
    "assets/images/explore.svg",
    color: Colors.black,
  );

  final Widget searchIcon = SvgPicture.asset(
    "assets/images/search.svg",
    color: Colors.black,
  );

  final Widget plusIcon = SvgPicture.asset(
    "assets/images/plus.svg",
    color: Colors.black,
  );

  final Widget bookedIcon = SvgPicture.asset(
    "assets/images/booked.svg",
    color: Colors.black,
  );

  final Widget meIcon = SvgPicture.asset(
    "assets/images/me.svg",
    color: Colors.black,
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
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) => state.setSelectedPageIndex(index),
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: exploreIcon,
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: searchIcon,
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: plusIcon,
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: bookedIcon,
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: meIcon,
            title: Container(),
          ),
        ],
      ),
    );
  }
}
