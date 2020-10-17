import 'package:flutter/material.dart';

import '../../helpers/dummy_data.dart';

class EventCategoryScreen extends StatefulWidget {
  static const String routeName = '/event-category-screen';

  @override
  _EventCategoryScreenState createState() => _EventCategoryScreenState();
}

class _EventCategoryScreenState extends State<EventCategoryScreen> {
  final dummy = DummyData();

  List<bool> events = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = ModalRoute.of(context).settings.arguments;
    List<List<String>> dummyData = DummyData().data;
    List<String> categories = [];
    switch (data.elementAt(0).elementAt(0)) {
      case 'Events':
        categories = dummy.allCat;
        break;
      case 'Outdoor Activities':
        categories = dummy.outdoorCat;
        break;
      case 'Accomodations':
        categories = dummy.accommCat;
        break;
      case 'Transportation':
        categories = dummy.transportCat;
        break;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      data.elementAt(0).elementAt(0),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //show buttons of different kinds of activities from the selected category
                for (int i = 0; i < categories.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              for (int j = 0; j < i; j++) events[j] = false;
                              events[i] = !events[i];
                              for (int j = i + 1; j < events.length; j++)
                                events[j] = false;
                            });
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              color: Theme.of(context).primaryColor,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          categories[i],
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        //if user clicks the button of the activity they want, show them four events of that kind
                        events[i] == true
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, left: 8.0, right: 8.0),
                                child: Container(
                                  height: 280,
                                  child: GridView(
                                    primary: false,
                                    children: <Widget>[
                                      for (int i = 0; i < 4; i++)
                                        Stack(
                                          children: [
                                            Card(
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  child: Image.asset(
                                                    'assets/images/events/' +
                                                        // data == null
                                                        //     ? 'https://1001freedownloads.s3.amazonaws.com/vector/thumb/315738/b7b6e07367f534efcb60b98a7e9a0c21-blurry-green-nature-background.jpg'
                                                        //     :
                                                        dummyData
                                                            .elementAt(i)
                                                            .elementAt(2),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Align(
                                                child: Text(
                                                  // data == null
                                                  //     ? 'Testing'
                                                  //     :
                                                  dummyData
                                                      .elementAt(i)
                                                      .elementAt(5),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                alignment: Alignment.topLeft,
                                              ),
                                            ),
                                          ],
                                        ),
                                    ],
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      childAspectRatio: 3 / 2,
                                      maxCrossAxisExtent: 200,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
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
