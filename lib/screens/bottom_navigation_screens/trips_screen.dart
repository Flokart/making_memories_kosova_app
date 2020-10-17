import 'package:flutter/material.dart';

import 'tripsPages/saved_page.dart';
import 'tripsPages/booked_page.dart';

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  var controller;
  @override
  Widget build(BuildContext context) {
    final tripsColor = Theme.of(context).primaryColor;
    controller = PageController(initialPage: 0);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: tripsColor,
          toolbarHeight: 56,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Text(
                  'Booked',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  'Saved',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        //the default tab is Booked, show Saved tab if user clicks the button or swipes left
        body: TabBarView(
          children: [
            BookedPage(),
            SavedPage(),
          ],
        ),
      ),
    );
  }
}
