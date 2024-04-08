import 'package:coffee/provider/cart_provider.dart';
import 'package:coffee/screens/cart/widgets/cart_app_bar.dart';
import 'package:coffee/screens/cart/widgets/empty_cart_view.dart';
import 'package:coffee/screens/cart/widgets/item_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false)
        .getCartItems(FirebaseAuth.instance.currentUser?.uid ?? '');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CartAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<CartProvider>(builder: (context, provider, child) {
          if (provider.cartItems.isEmpty) {
            return const EmptyCartView();
          } else {
            return ItemListView(provider: provider);
          }
        }),
      ),
    );
  }
}
