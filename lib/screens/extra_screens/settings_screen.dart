import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
                  color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).primaryColor,
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
                  color: Theme.of(context).primaryColor,
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(16),
              child: Text(
                'Travel Tools',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Container(
                width: double.infinity,
                child: Text(
                  'Other Tripadvisor Apps',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
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
