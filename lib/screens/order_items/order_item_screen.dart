import 'package:coffee/screens/order_items/widgets/order_item_app_bar.dart';
import 'package:coffee/screens/order_items/widgets/order_items_list_view.dart';
import 'package:flutter/material.dart';

import '../../provider/order_provider.dart';

class OrderItemScreen extends StatelessWidget {
  final OrderProvider provider;
  final int index;
  const OrderItemScreen({super.key, required this.provider, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OrderItemAppBar(),
      body: OrderItemsListView(
        currentIndex: index,
        provider: provider,
      ),
    );
  }
}
