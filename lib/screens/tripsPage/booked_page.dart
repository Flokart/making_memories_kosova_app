import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../stateManager/bottom_navigation_state.dart';

class BookedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BottomNavigationState state = Provider.of<BottomNavigationState>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
          left: 30,
          right: 30,
          bottom: 30,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Book your first event!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Making Memories Kosova gives you a fast, simple way to organize all your travel wish lists, recommendations and upcomnig plans in one place.'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                padding: const EdgeInsets.all(13),
                color: Color.fromRGBO(87,112, 182, 1),
                onPressed: () {
                  state.setSelectedPageIndex(0);
                },
                child: Container(
                    width: double.infinity,
                    color: Color.fromRGBO(87,112, 182, 1),
                    child: Text(
                      'Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
