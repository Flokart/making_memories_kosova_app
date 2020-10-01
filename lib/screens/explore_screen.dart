import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../screens/widgets/event_category_card.dart';
import '../screens/widgets/event_card.dart';

class ExploreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What we offer',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                          mainAxisSpacing: 10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                Container(
                  width: double.infinity,
                  height: 220,
                  child: Swiper(
                    controller: SwiperController(),
                    loop: false,
                    itemBuilder: (BuildContext context, int index) {
                      return EventCard(index, 'now');
                    },
                    itemCount: 2,
                    viewportFraction: 0.8,
                    scale: 0.9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                Container(
                  width: double.infinity,
                  height: 220,
                  child: Swiper(
                    controller: SwiperController(),
                    loop: false,
                    itemBuilder: (BuildContext context, int index) {
                      return EventCard(index, 'nearby');
                    },
                    itemCount: 2,
                    viewportFraction: 0.8,
                    scale: 0.9,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
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
                Container(
                  width: double.infinity,
                  height: 220,
                  child: Swiper(
                    controller: SwiperController(),
                    loop: false,
                    itemBuilder: (BuildContext context, int index) {
                      return EventCard(index, 'future');
                    },
                    itemCount: 2,
                    viewportFraction: 0.8,
                    scale: 0.9,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
