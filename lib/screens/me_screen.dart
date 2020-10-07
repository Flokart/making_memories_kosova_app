import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

import '../screens/settings_screen.dart';
import '../screens/providers/memories.dart';

class MeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 178, 196, 1),
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
              padding: const EdgeInsets.all(25),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  child: Icon(
                    Icons.account_circle,
                    size: 70,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                'Emri Mbiemri',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Padding(
            //         padding: const EdgeInsets.only(bottom: 20),
            //         child: Text(
            //           'Memories',
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       ),
            //       Container(
            //         width: double.infinity,
            //         height: 178,
            //         child: Swiper(
            //           controller: SwiperController(),
            //           loop: false,
            //           itemBuilder: (BuildContext context, int index) {
            //             return GestureDetector(
            //               onTap: () {},
            //               child: Stack(
            //                 children: <Widget>[
            //                   Image.network(
            //                     "https://miro.medium.com/max/700/1*U18aWqq2322t8Z26zZ0SIg.jpeg",
            //                     fit: BoxFit.fill,
            //                   ),
            //                   Align(
            //                     child: Container(
            //                       child: Padding(
            //                         padding: const EdgeInsets.all(8.0),
            //                         child: Row(
            //                           mainAxisAlignment:
            //                               MainAxisAlignment.spaceBetween,
            //                           children: <Widget>[
            //                             Text(
            //                               'Skijim ne Brezovice',
            //                               style: TextStyle(
            //                                   fontSize: 18,
            //                                   color: Colors.white),
            //                             ),
            //                             Text(
            //                               '12.06.2020',
            //                               style: TextStyle(
            //                                   fontSize: 18,
            //                                   color: Colors.white),
            //                             )
            //                           ],
            //                         ),
            //                       ),
            //                       alignment: Alignment.bottomCenter,
            //                       height: 35,
            //                       color: Colors.black.withOpacity(0.4),
            //                     ),
            //                     alignment: Alignment.bottomCenter,
            //                   )
            //                 ],
            //               ),
            //             );
            //           },
            //           itemCount: 10,
            //           viewportFraction: 0.8,
            //           scale: 0.9,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              width: double.infinity,
              height: 500,
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        'Memories',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 178,
                                      child: Swiper(
                                        controller: SwiperController(),
                                        loop: false,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Image(
                                            image: FileImage(
                                              memories.items[index].image,
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
                        // ListView.builder(
                        //     itemCount: memories.items.length,
                        //     itemBuilder: (ctx, i) => ListTile(
                        //       leading: CircleAvatar(
                        //         backgroundImage: FileImage(
                        //           memories.items[i].image,
                        //         ),
                        //       ),
                        //       title: Text('heyyy'),
                        //       onTap: () {
                        //         // Go to detail page ...
                        //       },
                        //     ),
                        //   ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
