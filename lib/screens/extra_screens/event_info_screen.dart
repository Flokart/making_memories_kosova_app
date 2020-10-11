import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/bottom_navigation_state.dart';
import '../../helpers/dummy_data.dart';

class EventInfoScreen extends StatelessWidget {
  static const String routeName = '/event-info-screen';
  final dummy = DummyData();

  @override
  Widget build(BuildContext context) {
    BottomNavigationState state = Provider.of<BottomNavigationState>(context);
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final List<List<String>> data = arguments.values.elementAt(0);
    final int index = arguments.values.elementAt(1);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.elementAt(index).elementAt(5),
                        style: TextStyle(fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () {
                          state.setSaved(true);
                        },
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Container(
                            width: 150,
                            height: 35,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Container(
                                color: Colors.deepOrangeAccent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Save Event',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.favorite_border,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Container(
                    width: 350,
                    height: 220,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        data.elementAt(index).elementAt(2),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.elementAt(index).elementAt(0),
                        style: TextStyle(fontSize: 25),
                      ),
                      Text(
                        data.elementAt(index).elementAt(1),
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    data.elementAt(index).elementAt(6),
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 22),
                    maxLines: 10,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 50,
              ),
              child: GestureDetector(
                onTap: () {
                  state.setBooked(true);
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.blue,
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'BOOK',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
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
