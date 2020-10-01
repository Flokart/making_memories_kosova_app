import 'package:flutter/material.dart';
import 'package:mmk/screens/dummy_data.dart';

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
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Image.network(
            data.elementAt(index).elementAt(2),
            fit: BoxFit.fill,
          ),
          Align(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
              alignment: Alignment.bottomCenter,
              height: 35,
              color: Colors.black.withOpacity(0.4),
            ),
            alignment: Alignment.bottomCenter,
          )
        ],
      ),
    );
  }
}
