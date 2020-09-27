import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            'You haven\'t saved anything yet',
            style: TextStyle(fontSize: 17),
            textAlign: TextAlign.center,
          ),
        ),
    );
  }
}