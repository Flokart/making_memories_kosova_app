import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/dummy_data.dart';
import '../extra_screens/event_category_screen.dart';

class EventCategoryCard extends StatelessWidget {
  EventCategoryCard([this.index]);
  final int index;
  final dummy = DummyData();

  @override
  Widget build(BuildContext context) {
    Color color;
    Widget icon;
    List<List<String>> data;
    switch (index) {
      case 0:
        data = dummy.events;
        color = Color.fromRGBO(240, 78, 82, 1);
        icon = SvgPicture.asset(
          "assets/icons/events.svg",
          color: Colors.white,
          height: 50,
        );
        break;
      case 1:
        data = dummy.outdoor;
        color = Color.fromRGBO(219, 149, 193, 1);
        icon = SvgPicture.asset(
          "assets/icons/outdoor.svg",
          color: Colors.white,
          height: 50,
        );
        break;
      case 2:
        data = dummy.accomm;
        color = Color.fromRGBO(87, 112, 182, 1);
        icon = SvgPicture.asset(
          "assets/icons/accommodation.svg",
          color: Colors.white,
          height: 50,
        );
        break;
      case 3:
        data = dummy.transport;
        color = Color.fromRGBO(100, 178, 196, 1);
        icon = SvgPicture.asset(
          "assets/icons/transportation.svg",
          color: Colors.white,
          height: 50,
        );
        break;
    }
    return GestureDetector(
      onTap: () {
        if (data != null)
          Navigator.of(context).pushNamed(
            EventCategoryScreen.routeName,
            arguments: data,
          );
      },
      child: Stack(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: color,
                  child: Center(
                    child: icon,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              child: Text(
                data == null ? 'Testing' : data.elementAt(0).elementAt(0),
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              alignment: Alignment.topLeft,
            ),
          ),
        ],
      ),
    );
  }
}
