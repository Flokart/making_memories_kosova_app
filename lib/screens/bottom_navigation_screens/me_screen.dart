import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import '../extra_screens/settings_screen.dart';
import '../providers/memories.dart';

class MeScreen extends StatelessWidget {
  final meColor = Color.fromRGBO(100, 178, 196, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: meColor,
        title: Text('Me'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: Icon(Icons.settings),
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
                      'assets/images/mmk_logo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Drin Ferataj', //to be dynamic for official release
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
                builder: (ctx, snapshot) => snapshot.connectionState ==
                        ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<Memories>(
                        child: Center(
                          child: const Text(
                              'Got no memories yet, start adding some!'),
                        ),
                        builder: (ctx, memories, ch) => memories.items.length <=
                                0
                            ? ch
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 178,
                                      child: Swiper(
                                        controller: SwiperController(),
                                        loop: false,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Card(
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
                                                    memories.items[index].image,
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
                                  ],
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
