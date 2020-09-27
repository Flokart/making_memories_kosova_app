import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mmk/screens/settings_screen.dart';

import 'navigation/bottom_navigation_bar.dart';
import 'stateManager/bottom_navigation_state.dart';

void main() {
  runApp(MMK());
}

class MMK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationState()),
      ],
      child: MaterialApp(
        routes: {
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
        title: 'MMK',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MMKBottomNavigationBar(),
      ),
    );
  }
}
