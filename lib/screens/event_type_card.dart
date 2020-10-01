import 'package:flutter/material.dart';
import 'package:mmk/screens/dummy_data.dart';

class EventTypeCard extends StatelessWidget {
  EventTypeCard(this.index);
  final int index;
  final dummyData = DummyData();

  @override
  Widget build(BuildContext context) {
    List<String> data;
    switch (index) {
      case 0:
        data = dummyData.outdoor;
        break;
      case 1:
        data = dummyData.indoor;
        break;
      case 2:
        data = dummyData.accomodations;
        break;
      case 3:
        data = dummyData.private;
        break;
    }
    return Stack(
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
                data.elementAt(1),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Align(
            child: Text(
              data.elementAt(0),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            alignment: Alignment.topLeft,
          ),
        ),
      ],
    );
  }
}
