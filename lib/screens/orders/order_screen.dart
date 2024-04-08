import 'package:coffee/provider/order_provider.dart';
import 'package:coffee/screens/orders/widgets/empty_order_view.dart';
import 'package:coffee/screens/orders/widgets/order_app_bar.dart';
import 'package:coffee/screens/orders/widgets/order_list_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<OrderProvider>(context, listen: false)
        .getAllOrders(FirebaseAuth.instance.currentUser?.uid ?? '');
    return Scaffold(
      appBar: const OrderAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<OrderProvider>(builder: (context, provider, child) {
          if (provider.orders.isEmpty) {
            return const EmptyOrderView();
          } else {
            return OrderListView(provider: provider);
          }
        }),
      ),
    );
  }
}
