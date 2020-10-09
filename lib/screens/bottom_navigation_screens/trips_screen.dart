import 'package:flutter/material.dart';

import 'tripsPages/saved_page.dart';
import 'tripsPages/booked_page.dart';

class TripsScreen extends StatefulWidget {
  @override
  _TripsScreenState createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  var controller;
  final tripsColor = Color.fromRGBO(87, 112, 182, 1);
  @override
  Widget build(BuildContext context) {
    controller = PageController(initialPage: 0);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: tripsColor,
          toolbarHeight: 56, // to be changed to dynamic in the future
          bottom: TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Tab(
                icon: Text(
                  'Booked',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  'Saved',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
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
