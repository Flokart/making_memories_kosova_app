import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/memories.dart';
import '../widgets/image_input.dart';

class AddMemoriesScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  AddMemoriesScreenState createState() => AddMemoriesScreenState();
}

class AddMemoriesScreenState extends State<AddMemoriesScreen> {
  File _pickedImage;
  final addMemoriesColor = Color.fromRGBO(243, 204, 44, 1);

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePhoto() {
    if (_pickedImage == null) {
      return;
    }
    Provider.of<Memories>(context, listen: false).addMemory(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Make new memories'),
        backgroundColor: addMemoriesColor,
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
                color: addMemoriesColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
