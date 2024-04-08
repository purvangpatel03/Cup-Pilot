import 'package:coffee/models/order_model.dart';
import 'package:coffee/provider/cart_provider.dart';
import 'package:coffee/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/user_provider.dart';
import '../../../theme/colors.dart';
import '../../../widgets/snack_bar_widget.dart';
import '../../../widgets/text_widget.dart';

class ItemListView extends StatelessWidget {
  final CartProvider provider;

  const ItemListView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    int totalPrice = 0;
    for (var item in provider.cartItems) {
      if (item.itemPrice != null && item.quantity != null) {
        totalPrice += item.itemPrice! * item.quantity!;
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextWidget(
          text: 'Order List',
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
            color: ThemeColor.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        getItemList(context),
        const SizedBox(
          height: 16,
        ),
        getTotalPrice(context, totalPrice),
        FilledButton(
          onPressed: () async {
            final user =
            Provider
                .of<UserProvider>(context, listen: false)
                .currentUser!;
            int balance = user.balance - totalPrice;
            final snackBar = MySnackBar().mySnackBar(
              text: 'Thank you for purchasing',
              context: context,
              backgroundColor: ThemeColor.text,
              elevation: 4,
              duration: 1,
              textColor: ThemeColor.white,
            );
            if (user.balance >= totalPrice) {
              await Provider.of<OrderProvider>(context, listen: false).addOrder(
                OrderModel(
                  uid: user.uid,
                  orderItems: provider.cartItems,
                ),
              );
              if(context.mounted){
                Provider.of<UserProvider>(context, listen: false)
                    .updateBalance(user.docId ?? '', balance);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              await provider.deleteAllItems(user.uid);
            } else {
              final snackBar = MySnackBar().mySnackBar(
                text: 'Not enough balance',
                context: context,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: TextWidget(
            text: 'Place Order',
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(
              color: ThemeColor.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  getItemList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: provider.cartItems.length,
        itemBuilder: (context, index) {
          int itemPrice = provider.cartItems[index].quantity! *
              provider.cartItems[index].itemPrice!;
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
                            provider.cartItems[index].itemImage ?? '',
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
                            text: provider.cartItems[index].itemName ?? '',
                            style: Theme
                                .of(context)
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
                                text: provider.cartItems[index].itemLocation ??
                                    '',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                  color: ThemeColor.textLight,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              TextWidget(
                                text: provider.cartItems[index].orderTime ?? '',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                  color: ThemeColor.textLight,
                                ),
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
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                  color: ThemeColor.primary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextWidget(
                                text: itemPrice.toString(),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                  color: ThemeColor.text,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                height: 24,
                                width: 48,
                                child: OutlinedButton(
                                  child: const Icon(
                                    size: 16,
                                    Icons.remove,
                                  ),
                                  onPressed: () {
                                    provider.decreaseQuantity(
                                        provider.cartItems[index]);
                                  },
                                ),
                              ),
                              TextWidget(
                                text: provider.cartItems[index].quantity
                                    ?.toString() ??
                                    '1',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                  color: ThemeColor.textLight,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                                width: 48,
                                child: OutlinedButton(
                                  child: const Icon(
                                    size: 16,
                                    Icons.add,
                                  ),
                                  onPressed: () {
                                    provider.increaseQuantity(
                                      provider.cartItems[index],
                                    );
                                  },
                                ),
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
    );
  }

  getTotalPrice(BuildContext context, int totalPrice) {
    return Row(
      children: [
        TextWidget(
          text: 'Total Price:',
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
            color: ThemeColor.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        TextWidget(
          text: 'Rs.',
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
            color: ThemeColor.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextWidget(
          text: totalPrice.toString(),
          style: Theme
              .of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(
            color: ThemeColor.text,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
