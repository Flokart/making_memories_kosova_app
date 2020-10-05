import 'package:flutter/material.dart';
import 'package:mmk/assets/dummy_data.dart';
import 'package:mmk/screens/widgets/event_card.dart';

class EventCategoryScreen extends StatelessWidget {
  static const String routeName = '/event-category-screen';
  final dummy = DummyData();

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = ModalRoute.of(context).settings.arguments;
    switch (data.elementAt(0).elementAt(0)) {
      case 'All Events':
        for (int i = 0; i < dummy.data.length; i++) {
          dummy.all.add(dummy.data[i]);
        }
        break;
      case 'Outdoor Activities':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][3] == 'outdoor') {
            dummy.outdoor.add(dummy.data[i]);
          }
        }
        break;
      case 'Accomodations':
        for (int i = 0; i < dummy.data.length; i++) {
          if (dummy.data[i][3] == 'acomm') {
            dummy.acomm.add(dummy.data[i]);
          }
        }
        break;
    }
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
