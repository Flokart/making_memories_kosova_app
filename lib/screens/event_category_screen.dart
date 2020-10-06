import 'package:flutter/material.dart';
import 'package:mmk/assets/dummy_data.dart';

class EventCategoryScreen extends StatelessWidget {
  static const String routeName = '/event-category-screen';
  final dummy = DummyData();

  @override
  Widget build(BuildContext context) {
    List<List<String>> data = ModalRoute.of(context).settings.arguments;
    List<String> categories = [];
    switch (data.elementAt(0).elementAt(0)) {
      case 'All Events':
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      data.elementAt(0).elementAt(0),
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                for (int i = 0; i < categories.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            categories[i],
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.arrow_right),
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
