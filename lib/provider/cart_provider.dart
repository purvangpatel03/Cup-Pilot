import 'package:coffee/firebase/firebase_helper.dart';
import 'package:flutter/material.dart';
import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> cartItems = [];

  getCartItems(String uid) async {
    cartItems = await FirebaseHelper().getCartItems(uid);
    notifyListeners();
  }

  addItem(CartModel cartModel) async {
    cartItems.add(cartModel);
    await FirebaseHelper().insertCartItem(cartModel);
    notifyListeners();
  }

  deleteItem(CartModel cartModel) async {
    cartItems.remove(cartModel);
    await FirebaseHelper().deleteCartItem(cartModel.docId ?? '');
    notifyListeners();
  }

  deleteAllItems(String uid) async {
    await FirebaseHelper().deleteAllCartItems(uid);
    await getCartItems(uid);
  }

  increaseQuantity(CartModel cartModel) async {
    final index = cartItems.indexOf(cartModel);
    cartItems[index].quantity = cartItems[index].quantity! + 1;
    await FirebaseHelper()
        .updateCartItem(cartModel.docId ?? '', cartItems[index].quantity ?? 1);
    notifyListeners();
  }

  decreaseQuantity(CartModel cartModel) async {
    final index = cartItems.indexOf(cartModel);
    if (cartItems[index].quantity != null) {
      if (cartItems[index].quantity! > 1) {
        cartItems[index].quantity = cartItems[index].quantity! - 1;
        await FirebaseHelper().updateCartItem(
            cartModel.docId ?? '', cartItems[index].quantity ?? 1);
      } else {
        cartItems.removeAt(index);
        await FirebaseHelper().deleteCartItem(cartModel.docId ?? '');
      }
    }
    notifyListeners();
  }
}
