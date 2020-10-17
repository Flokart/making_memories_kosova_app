import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'screens/extra_screens/event_category_screen.dart';
import 'screens/extra_screens/event_info_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/extra_screens/nearby_activities_screen.dart';
import 'screens/providers/memories.dart';
import 'screens/extra_screens/settings_screen.dart';
import 'navigation/bottom_navigation_bar.dart';
import 'navigation/bottom_navigation_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MMK());
  });
}

class MMK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavigationState()),
        ChangeNotifierProvider(create: (_) => Memories()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          MMKBottomNavigationBar.routeName: (ctx) => MMKBottomNavigationBar(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
          EventCategoryScreen.routeName: (ctx) => EventCategoryScreen(),
          NearbyEventsScreen.routeName: (ctx) => NearbyEventsScreen(),
          EventInfoScreen.routeName: (ctx) => EventInfoScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
        },
        title: 'MMK',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(43, 181, 100, 1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
