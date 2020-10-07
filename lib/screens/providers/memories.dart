import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mmk/models/memory_photo.dart';

// import '../models/place.dart';
import '../../helpers/db_helper.dart';

class Memories with ChangeNotifier {
  List<MemoryPhoto> _items = [];

  List<MemoryPhoto> get items {
    return [..._items];
  }

  void addMemory(
    File pickedImage,
  ) {
    final newPlace = MemoryPhoto(
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_memories', {
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetMemories() async {
    final dataList = await DBHelper.getData('user_memories');
    _items = dataList
        .map(
          (item) => MemoryPhoto(
                image: File(item['image']),
              ),
        )
        .toList();
    notifyListeners();
  }
}
