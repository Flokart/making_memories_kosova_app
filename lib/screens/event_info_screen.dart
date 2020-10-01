import 'package:flutter/material.dart';

import 'widgets/event_card.dart';

class EventInfoScreen extends StatelessWidget {
  static const String routeName = '/event-info-screen';

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final List<List<String>> data = arguments.values.elementAt(0);
    final int index = arguments.values.elementAt(1);
    return Scaffold(
      appBar: AppBar(
        title: Text(data.elementAt(index).elementAt(0)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (Column(
            children: [
              EventCard(1, 'now'),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 22),
                  maxLines: 10,
                ),
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 50,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.blue,
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      'BOOK',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
