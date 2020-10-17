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
  final successSnackbar = SnackBar(
    content: Text('Your memory has been added successfully in your profile!'),
    backgroundColor: Colors.green,
  );
  final failedSnackbar = SnackBar(
    content:
        Text('Proccess failed! Please make sure you have a valid picture!'),
    backgroundColor: Colors.red,
  );

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  //save the photo in the profile screen as a new memory
  void _savePhoto() {
    if (_pickedImage == null) {
      Scaffold.of(context).showSnackBar(failedSnackbar);
      return;
    }
    Provider.of<Memories>(context, listen: false).addMemory(_pickedImage);
    Scaffold.of(context).showSnackBar(successSnackbar);
  }

  @override
  Widget build(BuildContext context) {
    final addMemoriesColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Make new memories',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: addMemoriesColor,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //ImageInput widget that contains a preview of taken picture and the button to take a new one
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ImageInput(_selectImage),
            ),
            //the button that saves the taken picture as a new memory
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
              ),
              child: Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton.icon(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Add Memory',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _savePhoto,
                  elevation: 0,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  color: addMemoriesColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
