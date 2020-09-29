import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
                        Card(
                          elevation: 5,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          color: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          color: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ],
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 3 / 2,
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 20),
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
                  height: 177.5,
                  child: Swiper(
                    controller: SwiperController(),
                    loop: false,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/8/84/Ski_Famille_-_Family_Ski_Holidays.jpg",
                              fit: BoxFit.fill,
                            ),
                            Align(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Skijim ne Brezovice',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        '12.06.2020',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                alignment: Alignment.bottomCenter,
                                height: 35,
                                color: Colors.black.withOpacity(0.4),
                              ),
                              alignment: Alignment.bottomCenter,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 10,
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
                  height: 177.5,
                  child: Swiper(
                    controller: SwiperController(),
                    loop: false,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              "https://miro.medium.com/max/700/1*U18aWqq2322t8Z26zZ0SIg.jpeg",
                              fit: BoxFit.fill,
                            ),
                            Align(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Hiking ne Hajla',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        '18.06.2020',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                alignment: Alignment.bottomCenter,
                                height: 35,
                                color: Colors.black.withOpacity(0.4),
                              ),
                              alignment: Alignment.bottomCenter,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 10,
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
                  height: 177.5,
                  child: Swiper(
                    controller: SwiperController(),
                    loop: false,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              "https://miro.medium.com/max/700/1*U18aWqq2322t8Z26zZ0SIg.jpeg",
                              fit: BoxFit.fill,
                            ),
                            Align(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Skijim ne Brezovice',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                                      Text(
                                        '12.06.2020',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                alignment: Alignment.bottomCenter,
                                height: 35,
                                color: Colors.black.withOpacity(0.4),
                              ),
                              alignment: Alignment.bottomCenter,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 10,
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
