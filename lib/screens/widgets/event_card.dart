import 'package:flutter/material.dart';

import '../../assets/dummy_data.dart';
import '../event_info_screen.dart';

class EventCard extends StatelessWidget {
  EventCard(
    this.index,
    this.category,
  );

  final int index;
  final String category;
  final dummyData = DummyData();

  @override
  Widget build(BuildContext context) {
    List<List<String>> data;
    switch (category) {
      case 'now':
        data = dummyData.now;
        break;
      case 'nearby':
        data = dummyData.nearby;
        break;
      case 'future':
        data = dummyData.future;
        break;
    }
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          EventInfoScreen.routeName,
          arguments: {
            'data': data,
            'index': index,
          },
        );
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 180,
              child: Image.network(
                data.elementAt(index).elementAt(2),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: double.infinity,
              height: 35,
              color: Colors.black.withOpacity(0.4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      data.elementAt(index).elementAt(0),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    Text(
                      data.elementAt(index).elementAt(1),
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
