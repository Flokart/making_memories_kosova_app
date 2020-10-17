import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/bottom_navigation_state.dart';
import '../../helpers/dummy_data.dart';

class EventInfoScreen extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const String routeName = '/event-info-screen';
  final dummy = DummyData();

  _savedSnackBar(BuildContext context) {
    final savedSnackbar = SnackBar(
      content: Text('You have successfully saved this event'),
      backgroundColor: Colors.green,
    );
    _scaffoldKey.currentState.showSnackBar(savedSnackbar);
  }

  _bookedSnackBar(BuildContext context) {
    final bookedSnackbar = SnackBar(
      content: Text('You have successfully booked this event'),
      backgroundColor: Colors.green,
    );
    _scaffoldKey.currentState.showSnackBar(bookedSnackbar);
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationState state = Provider.of<BottomNavigationState>(context);
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final List<List<String>> data = arguments.values.elementAt(0);
    final int index = arguments.values.elementAt(1);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      //shows a column containing information about the event as well as buttons to save or book the event
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
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
                        _savedSnackBar(context);
                      },
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Container(
                          width: 150,
                          height: 35,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Container(
                              color: Colors.red[600],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Save Event',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    size: 18,
                                    color: Colors.white,
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
                    child: Image.asset(
                      'assets/images/events/' +
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
            child: RaisedButton(
              padding: const EdgeInsets.all(13),
              color: Colors.red[600],
              onPressed: () {
                state.setBooked(true);
                _bookedSnackBar(context);
              },
              child: Container(
                width: double.infinity,
                color: Colors.red[600],
                child: Text(
                  'BOOK',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
