import 'cart_model.dart';

class OrderModel{
  List<CartModel>? orderItems;
  String? docId;
  String? uid;

  OrderModel({this.orderItems, this.uid, this.docId});

  Map<String, dynamic> toMap(){
    return {
      'uid': uid,
    };
  }
}