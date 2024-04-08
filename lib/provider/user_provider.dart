import 'package:coffee/firebase/firebase_helper.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class UserProvider with ChangeNotifier{
  UserModel? currentUser;

  getUser(String uid) async{
    currentUser = await FirebaseHelper().getUserData(uid);
    notifyListeners();
  }

  updateBalance(String docId, int balance) async{
    await FirebaseHelper().updateUserBalance(docId, balance);
    notifyListeners();
  }

}