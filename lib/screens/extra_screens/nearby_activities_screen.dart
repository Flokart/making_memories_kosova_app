import 'package:flutter/material.dart';

import '../../helpers/dummy_data.dart';
import '../widgets/event_card.dart';

//shows events happening near the user
class NearbyEventsScreen extends StatelessWidget {
  static const String routeName = '/nearby-activities-screen';
  final List<List<String>> data = DummyData()
      .data
      .where((element) => element.elementAt(4) == 'nearby')
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Nearby Activities',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              for (int i = 1; i < data.length; i++)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EventCard(i, data.elementAt(0).elementAt(4)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
