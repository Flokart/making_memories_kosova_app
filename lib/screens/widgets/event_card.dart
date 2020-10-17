import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/dummy_data.dart';
import '../extra_screens/event_info_screen.dart';

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
      case 'all':
        data = dummy.data;
        break;
      case 'now':
        data = dummy.data
            .where((element) => element.elementAt(4) == 'now')
            .toList();
        break;
      case 'nearby':
        data = dummy.data
            .where((element) => element.elementAt(4) == 'nearby')
            .toList();
        break;
      case 'future':
        data = dummy.data
            .where((element) => element.elementAt(4) == 'future')
            .toList();
        break;
      case 'Events':
        data = dummy.events;
        break;
      case 'Outdoor Activities':
        data = dummy.outdoor;
        break;
      case 'Accomodations':
        data = dummy.accomm;
        break;
      case 'booked':
        data = dummy.booked;
        break;
      case 'saved':
        data = dummy.saved;
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
                child: Image.asset(
                  'assets/images/events/' + data.elementAt(index).elementAt(2),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Container(
            width: 310,
            height: 190,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SvgPicture.asset(
                      'assets/images/events/' +
                          data.elementAt(index).elementAt(0) +
                          '.svg',
                      color: Colors.white,
                      height: 35,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      data.elementAt(index).elementAt(5),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
