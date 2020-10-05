import 'package:flutter/material.dart';

import '../../assets/dummy_data.dart';
import '../event_info_screen.dart';

// ignore: must_be_immutable
class EventCard extends StatelessWidget {
  EventCard(
    this.index,
    this.category,
  );

  final int index;
  final String category;
  final dummy = DummyData();
  List<List<String>> data;

  @override
  Widget build(BuildContext context) {
    switch (category) {
      case 'now':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][4] == 'now')
            dummy.now.add(dummy.data[i]);
          data = dummy.now;
        }
        break;
      case 'nearby':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][4] == 'nearby')
            dummy.nearby.add(dummy.data[i]);
          data = dummy.nearby;
        }
        break;
      case 'future':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][4] == 'future')
            dummy.future.add(dummy.data[i]);
          data = dummy.future;
        }
        break;
        case 'All Events':
        for (int i = 0; i < dummy.data.length; i++) {
          dummy.all.add(dummy.data[i]);
        }
          data = dummy.all;
        break;
        case 'Outdoor Activities':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][3] == 'outdoor')
            dummy.outdoor.add(dummy.data[i]);
          data = dummy.outdoor;
        }
        break;
        case 'Accomodations':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][3] == 'acomm')
            dummy.acomm.add(dummy.data[i]);
          data = dummy.acomm;
        }
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
