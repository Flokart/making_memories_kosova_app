import 'package:flutter/material.dart';
import 'package:mmk/assets/dummy_data.dart';
import 'package:mmk/screens/widgets/event_card.dart';

class NearbyEventsScreen extends StatelessWidget {
  static const String routeName = '/nearby-events-screen';
  final dummy = DummyData();

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.elementAt(0).elementAt(0)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                for (int i = 1; i < data.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: EventCard(i, data.elementAt(0).elementAt(0)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
