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
          if (dummy.data[i][4] == 'now') dummy.now.add(dummy.data[i]);
          data = dummy.now;
        }
        break;
      case 'nearby':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][4] == 'nearby') dummy.nearby.add(dummy.data[i]);
          data = dummy.nearby;
        }
        break;
      case 'future':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][4] == 'future') dummy.future.add(dummy.data[i]);
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
          if (dummy.data[i][3] == 'outdoor') dummy.outdoor.add(dummy.data[i]);
          data = dummy.outdoor;
        }
        break;
      case 'Accomodations':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][3] == 'accomm') dummy.accomm.add(dummy.data[i]);
          data = dummy.accomm;
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
      child: Stack(
        children: <Widget>[
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Container(
              width: 310,
              height: 190,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  data.elementAt(index).elementAt(2),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 15),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                data.elementAt(index).elementAt(5),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: 35,
          //   color: Colors.black.withOpacity(0.4),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 8),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: <Widget>[
          //         Text(
          //           data.elementAt(index).elementAt(0),
          //           style: TextStyle(fontSize: 18, color: Colors.white),
          //         ),
          //         Text(
          //           data.elementAt(index).elementAt(1),
          //           style: TextStyle(fontSize: 18, color: Colors.white),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
