import 'package:flutter/material.dart';
import 'package:mmk/screens/widgets/event_card.dart';

class EventCategoryScreen extends StatelessWidget {
  static const String routeName = '/event-category-screen';

  @override
  Widget build(BuildContext context) {
    final List<String> data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.elementAt(0)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EventCard(0, 'now'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EventCard(0, 'now'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: EventCard(0, 'now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
