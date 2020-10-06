import 'package:flutter/material.dart';

import '../../assets/dummy_data.dart';
import '../event_category_screen.dart';

class EventCategoryCard extends StatelessWidget {
  EventCategoryCard(this.index);
  final int index;
  final dummy = DummyData();

  @override
  Widget build(BuildContext context) {
    List<List<String>> data;
    switch (index) {
      case 0:
        for (int i = 0; i < dummy.data.length; i++) {
          dummy.all.add(dummy.data[i]);
        }
        data = dummy.all;
        break;
      case 1:
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][3] == 'outdoor') {
            dummy.outdoor.add(dummy.data[i]);
          }
        }
        data = dummy.outdoor;
        break;
      case 2:
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][3] == 'accomm') {
            dummy.accomm.add(dummy.data[i]);
          }
        }
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
