import 'package:flutter/material.dart';

import '../../helpers/dummy_data.dart';
import '../../screens/extra_screens/event_info_screen.dart';
import '../../screens/extra_screens/nearby_events_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchColor = Color.fromRGBO(229, 106, 46, 1);
  List<List<String>> data = DummyData().data;
  List<List<String>> filteredData = [];
  final myController = TextEditingController();

  void _filterData(value) {
    setState(() {
      filteredData = data
          .where((element) =>
              element.elementAt(5).toLowerCase().contains(value.toLowerCase()))
          .toList();
      print(filteredData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: searchColor,
        title: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            child: TextField(
              controller: myController,
              onChanged: (value) {
                _filterData(value);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: myController.text == ''
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                          height: 240,
                          width: double.infinity,
                          child: Card(
                            child: Stack(children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                  NearbyEventsScreen.routeName,
                                ),
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
                                  style: TextStyle(
                                      fontSize: 28, color: Colors.white),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 15),
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
                  )
                : Center(
                    child: Column(
                      children: [
                        for (int i = 0; i < filteredData.length; i++)
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                EventInfoScreen.routeName,
                                arguments: {
                                  'data': data,
                                  'index': i,
                                },
                              );
                            },
                            child: Stack(
                              children: <Widget>[
                                Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Container(
                                    width: 310,
                                    height: 190,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25.0),
                                      child: Image.network(
                                        filteredData.elementAt(i).elementAt(2),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 310,
                                  height: 190,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Icon(
                                            Icons.rowing,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(
                                            filteredData
                                                .elementAt(i)
                                                .elementAt(5),
                                            style: TextStyle(
                                              fontSize: 25,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  )),
      ),
    );
  }
}
