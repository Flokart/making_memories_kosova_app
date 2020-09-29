import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                height: 230,
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      'Nearby Activities',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                  elevation: 5,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
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
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
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
                  Text(
                    'Boge Skiing',
                    style: TextStyle(fontSize: 18),
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
    );
  }
}
