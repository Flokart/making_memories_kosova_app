import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/add_memories_screen.dart';
import '../screens/search_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/me_screen.dart';
import '../screens/trips_screen.dart';

import '../stateManager/bottom_navigation_state.dart';

class MMKBottomNavigationBar extends StatelessWidget {
  final Widget exploreIcon = SvgPicture.asset(
    "assets/images/explore.svg",
    // color: Colors.white,
  );

  final Widget searchIcon = SvgPicture.asset(
    "assets/images/search.svg",
    // color: Colors.white,
  );

  final Widget plusIcon = SvgPicture.asset(
    "assets/images/plus.svg",
    // color: Colors.white,
  );

  final Widget bookedIcon = SvgPicture.asset(
    "assets/images/booked.svg",
    // color: Colors.white,
  );

  final Widget meIcon = SvgPicture.asset(
    "assets/images/me.svg",
    // color: Colors.white,
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
            // icon: Icon(Icons.search),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: plusIcon,
            // icon: Icon(Icons.add),
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
