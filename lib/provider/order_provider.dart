import 'package:flutter/material.dart';

import '../firebase/firebase_helper.dart';
import '../models/order_model.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orders = [];

  getAllOrders(String uid) async {
    orders = await FirebaseHelper().getOrderData(uid);
    notifyListeners();
  }

  addOrder(OrderModel orderModel) async {
    orders.add(orderModel);
    await FirebaseHelper().insertOrder(orderModel);
    notifyListeners();
  }

  deleteOrder(OrderModel orderModel) async{
    final index = orders.indexOf(orderModel);
    orders.removeAt(index);
    await FirebaseHelper().deleteOrder(orderModel.docId!);
    notifyListeners();
  }
}
