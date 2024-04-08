import 'dart:async';
import 'dart:typed_data';

import 'package:coffee/models/order_model.dart';
import 'package:coffee/models/rest_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/cart_model.dart';
import '../models/item_model.dart';

class FirebaseHelper {

  //Restaurant Firebase Query
  final CollectionReference restCollection =
      FirebaseFirestore.instance.collection('restData');

  Future insertRest(RestModel restModel) async {
    await restCollection.add(
      restModel.toMap(),
    );
  }

  Future<List<RestModel>> getRestData() async {
    final QuerySnapshot querySnapshot = await restCollection.get();

    List<RestModel> restData = [];
    for (var docs in querySnapshot.docs) {
      final data = docs.data() as Map<String, dynamic>;
      try {
        final downloadRef = restImageRef.child('${data['restName']}.jpg');
        Uint8List? image = await downloadRef.getData();
        final rest = RestModel(
          restImage: image,
          restName: data['restName'],
          restLocation: data['restLocation'],
          orderTime: data['orderTime'],
          restId: docs.id,
        );
        restData.add(rest);
      } on FirebaseException catch (e) {
        print(e.message);
      }
    }
    return restData;
  }

  //UserData Firebase Query

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('userData');

  Future insertUser(UserModel userModel) async {
    await userCollection.add(
      userModel.toMap(),
    );
  }

  Future<UserModel?> getUserData(String uid) async {
    final QuerySnapshot querySnapshot =
        await userCollection.where('uid', isEqualTo: uid).get();
    UserModel? user;
    for (var docs in querySnapshot.docs) {
      final data = docs.data() as Map<String, dynamic>;
      try {
        user = UserModel(
          name: data['name'],
          uid: data['uid'],
          balance: data['balance'],
          docId: docs.id,
        );
      } on FirebaseException catch (e) {
        print(e.message);
      }
    }
    return user;
  }

  Future updateUserBalance(String docId, int balance) async {
    await userCollection.doc(docId).update({
      'balance': balance,
    });
  }



  //CartItems Firebase Query

  final CollectionReference cartCollection =
      FirebaseFirestore.instance.collection('cartData');

  final restImageRef = FirebaseStorage.instance.ref('restImages');

  Future insertCartItem(CartModel cartModel) async {
    await cartCollection.add(
      cartModel.toMap(),
    );
  }

  Future updateCartItem(String docId, int quantity) async {
    await cartCollection.doc(docId).update({
      'quantity': quantity,
    });
  }

  Future deleteCartItem(String docId) async {
    await cartCollection.doc(docId).delete();
  }

  Future deleteAllCartItems(String uid) async {
    QuerySnapshot querySnapshot =
        await cartCollection.where('uid', isEqualTo: uid).get();
    for (var item in querySnapshot.docs) {
      item.reference.delete();
    }
  }

  Future<List<CartModel>> getCartItems(String uid) async {
    QuerySnapshot querySnapshot =
        await cartCollection.where('uid', isEqualTo: uid).get();
    List<CartModel> cartItems = [];
    for (var docs in querySnapshot.docs) {
      final data = docs.data() as Map<String, dynamic>;
      try {
        cartItems.add(CartModel(
          quantity: data['quantity'],
          itemId: data['itemId'],
          docId: docs.id,
          itemPrice: data['itemPrice'],
          orderTime: data['orderTime'],
          itemLocation: data['itemLocation'],
          itemName: data['itemName'],
          itemImage: data['itemImage'],
        ));
      } on FirebaseException catch (e) {
        print(e.message);
      }
    }
    return cartItems;
  }

  //myOrder Firebase query

  final CollectionReference orderCollection =
      FirebaseFirestore.instance.collection('orderData');

  Future insertOrder(OrderModel orderModel) async {
    final docRef = await orderCollection.add(orderModel.toMap());
    final itemRef = docRef.collection('orderItems');
    for (var item in orderModel.orderItems!) {
      print('added');
      await itemRef.add(item.toMap());
    }
  }

  Future deleteOrder(String docId) async {
    await orderCollection.doc(docId).delete();
  }

  Future<List<OrderModel>> getOrderData(String uid) async {
    QuerySnapshot querySnapshot =
        await orderCollection.where('uid', isEqualTo: uid).get();
    List<OrderModel> orderItems = [];
    for (var docs in querySnapshot.docs) {
      final data = docs.data() as Map<String, dynamic>;
      List<CartModel> cartItems = [];
      final itemRef = docs.reference.collection('orderItems');
      final itemQuerySnapshot = await itemRef.get();
      for (var item in itemQuerySnapshot.docs) {
        final itemData = item.data();
        cartItems.add(
          CartModel(
            itemImage: itemData['itemImage'],
            itemPrice: itemData['itemPrice'],
            docId: item.id,
            uid: itemData['uid'],
            itemName: itemData['itemName'],
            orderTime: itemData['orderTime'],
            quantity: itemData['quantity'],
            itemLocation: itemData['itemLocation'],
          ),
        );
      }
      orderItems.add(OrderModel(
        uid: data['uid'],
        docId: docs.id,
        orderItems: cartItems,
      ));
    }
    return orderItems;
  }

  //items Query

  final CollectionReference itemCollection =
      FirebaseFirestore.instance.collection('itemData');

  Future insertItem(ItemModel itemModel) async {
    await itemCollection.add(itemModel.toMap());
  }

  Future<List<ItemModel>> getItems(String restId) async {
    QuerySnapshot queryItems =
        await itemCollection.where('restId', isEqualTo: restId).get();
    List<ItemModel> items = [];
    for (var docs in queryItems.docs) {
      final data = docs.data() as Map<String, dynamic>;
      items.add(
        ItemModel(
          itemPrice: data['itemPrice'],
          itemId: docs.id,
          restId: data['restId'],
          itemName: data['itemName'],
          itemImage: data['itemImage'],
        ),
      );
    }
    return items;
  }
}
