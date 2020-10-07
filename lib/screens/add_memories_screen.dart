import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/providers/memories.dart';
import 'widgets/image_input.dart';

class AddMemoriesScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  AddMemoriesScreenState createState() => AddMemoriesScreenState();
}

class AddMemoriesScreenState extends State<AddMemoriesScreen> {
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePhoto() {
    if (_pickedImage == null) {
      return;
    }
    Provider.of<Memories>(context, listen: false).addMemory(_pickedImage);
    print('Memories added...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make new memories'),
        backgroundColor: Color.fromRGBO(243, 204, 44, 1),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ImageInput(_selectImage),
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: RaisedButton.icon(
                icon: Icon(Icons.add),
                label: Text('Add Memory'),
                onPressed: _savePhoto,
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                color: Color.fromRGBO(243, 204, 44, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
