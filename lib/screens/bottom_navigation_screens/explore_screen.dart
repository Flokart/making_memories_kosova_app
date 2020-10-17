import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../../helpers/dummy_data.dart';
import '../widgets/event_category_card.dart';
import '../widgets/event_card.dart';

// ignore: must_be_immutable
class ExploreScreen extends StatelessWidget {
  int init = 0;
  final dummy = DummyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Explore',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'What we offer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              //show different categories of services that we offer to the user
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 8,
                  right: 8,
                ),
                child: Container(
                  height: 280,
                  child: GridView(
                    primary: false,
                    children: <Widget>[
                      EventCategoryCard(0),
                      EventCategoryCard(1),
                      EventCategoryCard(2),
                      EventCategoryCard(3),
                    ],
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      childAspectRatio: 3 / 2,
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Happening Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              //show events or activites happening right now
              Container(
                width: double.infinity,
                height: 220,
                child: Swiper(
                  controller: SwiperController(),
                  loop: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EventCard(index, 'now');
                  },
                  itemCount: dummy.data
                      .where((element) => element.elementAt(4) == 'now')
                      .toList()
                      .length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nearby Events',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              //show events or activites happening near you
              Container(
                width: double.infinity,
                height: 220,
                child: Swiper(
                  controller: SwiperController(),
                  loop: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EventCard(index, 'nearby');
                  },
                  itemCount: dummy.data
                      .where((element) => element.elementAt(4) == 'nearby')
                      .toList()
                      .length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Future Events',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              //show events or activites happening in the future
              Container(
                width: double.infinity,
                height: 220,
                child: Swiper(
                  controller: SwiperController(),
                  loop: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EventCard(index, 'future') ?? Container();
                  },
                  itemCount: dummy.data
                      .where((element) => element.elementAt(4) == 'future')
                      .toList()
                      .length,
                  viewportFraction: 0.8,
                  scale: 0.9,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
