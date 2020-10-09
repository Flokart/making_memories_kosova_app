import 'package:flutter/material.dart';

import '../../helpers/dummy_data.dart';
import '../extra_screens/event_category_screen.dart';

class EventCategoryCard extends StatelessWidget {
  EventCategoryCard(this.index);
  final int index;
  final dummy = DummyData();

  @override
  Widget build(BuildContext context) {
    List<List<String>> data;
    switch (index) {
      case 0:
        data = dummy.all;
        break;
      case 1:
        data = dummy.outdoor;
        break;
      case 2:
        data = dummy.accomm;
        break;
      case 3:
        data = dummy.transport;
        break;
    }
    return GestureDetector(
      onTap: () {
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
                child: Image.network(
                  data.elementAt(0).elementAt(1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Align(
              child: Text(
                data.elementAt(0).elementAt(0),
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
