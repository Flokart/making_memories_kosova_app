import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../helpers/dummy_data.dart';
import '../../screens/extra_screens/event_info_screen.dart';
import '../extra_screens/nearby_activities_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<List<String>> data = DummyData().data;
  List<List<String>> filteredData = [];
  final myController = TextEditingController();
  final List<String> popularSearches = [
    'Luboten Hiking',
    'Rugova ZipLine',
    'Skarpa Skiing',
    'Coffee Shops',
    'Sport Halls',
  ];

  //filter data based on user input on the search bar as "value" argument
  void _filterData(value) {
    setState(() {
      filteredData = data
              .where(
                (element) => element
                    .elementAt(5)
                    .toLowerCase()
                    .contains(value.toLowerCase()),
              )
              .toList() +
          data
              .where(
                (element) => element
                    .elementAt(0)
                    .toLowerCase()
                    .contains(value.toLowerCase()),
              )
              .toList();
    });
    print(filteredData);
  }

  @override
  Widget build(BuildContext context) {
    final searchColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: searchColor,
        title: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          //search bar insinde the appBar
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
          //while the user has not yet typed anything on the search bar show Nearby Activities button and popular searches
          child: myController.text == ''
              ? Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 240,
                        width: double.infinity,
                        child: Card(
                          child: Stack(
                            children: [
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
                            ],
                          ),
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
                          for (int i = 0; i < popularSearches.length; i++)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        myController.text = popularSearches[i];
                                        _filterData(
                                          myController.text.substring(
                                            0,
                                            myController.text.indexOf(' '),
                                          ),
                                        );
                                      });
                                    },
                                    child: Text(
                                      popularSearches[i],
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                )
              //if the the user input doesn't match any existing activity or event inform them and show popular searches
              : filteredData.isEmpty
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Center(
                            child: Text(
                              'Sorry, no such events found!',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Recommended Searches',
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
                              for (int i = 0; i < popularSearches.length; i++)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            myController.text =
                                                popularSearches[i];
                                            _filterData(
                                              myController.text.substring(
                                                0,
                                                myController.text.indexOf(' '),
                                              ),
                                            );
                                          });
                                        },
                                        child: Text(
                                          popularSearches[i],
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    )
                  //else show a Centered Column containing the results of user's searching
                  : Center(
                      child: Column(
                        children: [
                          for (int i = 0; i < filteredData.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    EventInfoScreen.routeName,
                                    arguments: {
                                      'data': filteredData,
                                      'index': i,
                                    },
                                  );
                                },
                                child: Stack(
                                  children: <Widget>[
                                    Card(
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
                                          child: Image.asset(
                                            'assets/images/events/' +
                                                filteredData
                                                    .elementAt(i)
                                                    .elementAt(2),
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
                                              child: SvgPicture.asset(
                                                'assets/images/icons/' +
                                                    data
                                                        .elementAt(i)
                                                        .elementAt(0) +
                                                    '.svg',
                                                color: data
                                                            .elementAt(i)
                                                            .elementAt(0) ==
                                                        'Paragliding'
                                                    ? Colors.grey
                                                    : Colors.white,
                                                height: 35,
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
                            ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
