import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/bottom_navigation_state.dart';
import '../../screens/login/login_screen.dart';

//shows settings of the app and the sign out button
class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings-screen';

  @override
  Widget build(BuildContext context) {
    final settingsColor = Theme.of(context).primaryColor;
    BottomNavigationState state = Provider.of<BottomNavigationState>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              child: Text(
                'Preferences',
                style: TextStyle(
                  color: settingsColor,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Text(
                  'Language',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Text(
                  'Currency',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Text(
                  'Units',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Text(
                  'Notifications',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Divider(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              child: Text(
                'Bookings and Payment',
                style: TextStyle(
                  color: settingsColor,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Text(
                  'Bookings',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Divider(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              child: Text(
                'Support',
                style: TextStyle(
                  color: settingsColor,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Text(
                  'Help Center',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Text(
                  'App Feedback',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  state.setSelectedPageIndex(0);
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
                color: settingsColor,
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Sign Out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
