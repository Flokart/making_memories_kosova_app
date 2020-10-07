import 'package:flutter/material.dart';
import 'package:mmk/screens/nearby_events_screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(229, 106, 46, 1),
          actions: [
            Container(
              width: double.infinity,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.all(4),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'Search',
              //       contentPadding:
              //           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(25),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  height: 240,
                  width: double.infinity,
                  child: Card(
                    child: Stack(children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushNamed(NearbyEventsScreen.routeName),
                        child: Container(
                          width: 390,
                          height: 240,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              'https://oecdenvironmentfocusblog.files.wordpress.com/2020/06/wed-blog-shutterstock_1703194387_low_nwm.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'Nearby Activities',
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ),
                    ]),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Popular Searches',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Gjeravica Hiking',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Rugova ZipLine',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Boge Skiing',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Coffee Shops',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Sport Halls',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
