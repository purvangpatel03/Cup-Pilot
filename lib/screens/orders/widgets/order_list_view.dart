import 'package:coffee/provider/order_provider.dart';
import 'package:coffee/screens/order_items/order_item_screen.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class OrderListView extends StatelessWidget {
  final OrderProvider provider;

  const OrderListView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextWidget(
          text: 'Order History',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: ThemeColor.text,
                fontWeight: FontWeight.w700,
              ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: provider.orders.length,
            itemBuilder: (context, index) {
              int totalPrice = 0;
              if(provider.orders[index].orderItems != null){
                for(var item in provider.orders[index].orderItems!){
                  if(item.itemPrice != null && item.quantity != null){
                    totalPrice += item.itemPrice! * item.quantity!;
                  }
                }
              }
              return Padding(
                padding: const EdgeInsets.only(
                  top: 16,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            OrderItemScreen(provider: provider, index: index),
                      ),
                    );
                  },
                  child: PhysicalModel(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 12,
                    shadowColor: Colors.grey.withOpacity(0.3),
                    child: Container(
                      height: 96,
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              provider.orders[index].orderItems?[0].itemImage ??
                                  '',
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Order ${index + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: ThemeColor.text,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextWidget(
                                text:
                                    'Total items: ${provider.orders[index].orderItems?.length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: ThemeColor.text,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextWidget(
                                text: 'Order price: $totalPrice',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                  color: ThemeColor.textLight,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
