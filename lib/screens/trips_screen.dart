import 'package:flutter/material.dart';
import 'package:mmk/screens/tripsPage/saved_page.dart';
import 'package:mmk/screens/tripsPage/booked_page.dart';

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  var controller;
  var chat = false;
  @override
  Widget build(BuildContext context) {
    controller = PageController(initialPage: 0);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Text(
                    'Booked',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
                Tab(
                  icon: Text(
                    'Saved',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
            title: Text('Trips'),
          ),
          body: TabBarView(
            children: [
              BookedPage(),
              SavedPage(),
            ],
          ),
        ),
      ),
    );
  }
}
