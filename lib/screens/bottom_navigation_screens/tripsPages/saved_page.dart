import 'package:flutter/material.dart';
import 'package:mmk/screens/widgets/event_card.dart';
import 'package:provider/provider.dart';

import '../../../navigation/bottom_navigation_state.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final savedColor = Theme.of(context).primaryColor;
    BottomNavigationState state = Provider.of<BottomNavigationState>(context);
    bool savedContent = state.getSaved;
    return Container(
      child: savedContent
          //if anything saved show the first event from now category
          ? Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Align(
                alignment: Alignment.topCenter,
                child: EventCard(0, 'now'),
              ),
            )
          //else show a text and a button that redirects the user to the explore screen
          : Padding(
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
                      'Save your favorite events!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      color: savedColor,
                      onPressed: () {
                        state.setSelectedPageIndex(0);
                      },
                      child: Container(
                        width: double.infinity,
                        color: savedColor,
                        child: Text(
                          'Get Started',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
