import 'package:coffee/firebase/firebase_helper.dart';
import 'package:flutter/material.dart';

import '../models/item_model.dart';

class ItemProvider with ChangeNotifier{

  List<ItemModel> items = [];

  getItems(String restId) async {
    items = await FirebaseHelper().getItems(restId);
    notifyListeners();
  }
}