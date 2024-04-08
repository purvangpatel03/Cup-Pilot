import 'package:flutter/material.dart';

import '../../../provider/order_provider.dart';
import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class OrderItemsListView extends StatelessWidget {
  final OrderProvider provider;
  final int currentIndex;

  const OrderItemsListView(
      {super.key, required this.provider, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextWidget(
            text: 'Order Items',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: ThemeColor.text,
                ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: provider.orders[currentIndex].orderItems?.length ?? 0,
              itemBuilder: (context, index) {
                int itemTotalPrice = 0;
                if (provider.orders[currentIndex].orderItems != null) {
                  if (provider.orders[currentIndex].orderItems![index]
                              .quantity !=
                          null &&
                      provider.orders[currentIndex].orderItems![index]
                              .itemPrice !=
                          null) {
                    itemTotalPrice = provider
                            .orders[currentIndex].orderItems![index].quantity! *
                        provider
                            .orders[currentIndex].orderItems![index].itemPrice!;
                  }
                }
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: PhysicalModel(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    elevation: 12,
                    shadowColor: Colors.grey.withOpacity(0.3),
                    child: Container(
                        height: 108,
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    height: 92,
                                    width: 92,
                                    fit: BoxFit.cover,
                                    provider.orders[currentIndex]
                                            .orderItems?[index].itemImage ??
                                        '',
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 12.0, right: 8),
                                  child: Icon(
                                    color: Colors.white,
                                    Icons.favorite_border,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  TextWidget(
                                    text: provider.orders[currentIndex]
                                            .orderItems?[index].itemName ??
                                        '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: ThemeColor.text,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: ThemeColor.primary,
                                        size: 16,
                                      ),
                                      TextWidget(
                                        text: provider
                                                .orders[currentIndex]
                                                .orderItems?[index]
                                                .itemLocation ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: ThemeColor.textLight),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      TextWidget(
                                        text: provider.orders[currentIndex]
                                                .orderItems?[index].orderTime ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: ThemeColor.textLight),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text: 'Rs.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: ThemeColor.primary,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      TextWidget(
                                        text: itemTotalPrice.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: ThemeColor.text,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      const Spacer(),
                                      TextWidget(
                                        text: 'Quantity:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: ThemeColor.primary,
                                                fontWeight: FontWeight.w700),
                                      ),
                                      TextWidget(
                                        text: provider.orders[currentIndex]
                                                .orderItems?[index].quantity
                                                .toString() ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: ThemeColor.text,
                                              fontWeight: FontWeight.w700,
                                            ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ),
                  ),
                );
              },
            ),
          ),
          FilledButton(
            onPressed: () async{
              await provider.deleteOrder(provider.orders[currentIndex]);
              if(context.mounted){
                Navigator.pop(context);
              }
            },
            child: TextWidget(
              text: 'Delete Order History',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ThemeColor.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
