import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import '../extra_screens/settings_screen.dart';
import '../providers/memories.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final meColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: meColor,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(SettingsScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  width: 160,
                  height: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.asset(
                      'assets/images/Drini.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Drin Ferataj',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                'Your Memories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: FutureBuilder(
                future: Provider.of<Memories>(context, listen: false)
                    .fetchAndSetMemories(),
                //show Circular Progress Indicator while waiting for data
                builder: (ctx, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<Memories>(
                        // if the user has no photo memories show a button to go to add_memories screen
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: const Text(
                              'You\'ve got no memories yet, start adding some!',
                            ),
                          ),
                        ),
                        builder: (ctx, memories, ch) => memories.items.length <=
                                0
                            ? ch
                            //if the user has photo memories show them in a Swiper
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  child: Swiper(
                                    controller: SwiperController(),
                                    loop: false,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                          child: Container(
                                            width: 310,
                                            height: 190,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              child: Image(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  //sort the images from most recent to the oldest
                                                  memories
                                                      .items[memories
                                                              .items.length -
                                                          index -
                                                          1]
                                                      .image,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: memories.items.length,
                                    viewportFraction: 0.8,
                                    scale: 0.9,
                                  ),
                                ),
                              ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
