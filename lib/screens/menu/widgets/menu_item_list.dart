import 'package:coffee/models/cart_model.dart';
import 'package:coffee/provider/cart_provider.dart';
import 'package:coffee/provider/item_provider.dart';
import 'package:coffee/widgets/snack_bar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/rest_model.dart';
import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class MenuItemList extends StatelessWidget {
  final RestModel? restModel;

  const MenuItemList({super.key, this.restModel});

  @override
  Widget build(BuildContext context) {
    Provider.of<ItemProvider>(context, listen: false)
        .getItems(restModel?.restId ?? '');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'My Products',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: ThemeColor.text,
              ),
        ),
        Consumer<ItemProvider>(
          builder: (context, provider, child) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: provider.items.length,
              itemBuilder: (context, index) {
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
                                  provider.items[index].itemImage ?? '',
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
                                  text: provider.items[index].itemName ?? '',
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
                                      text: restModel?.restLocation ?? '',
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
                                      text: restModel?.orderTime ?? '',
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
                                      text: provider.items[index].itemPrice
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            color: ThemeColor.text,
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: 30,
                                      child: FloatingActionButton(
                                        heroTag: null, // index,
                                        child: const Icon(
                                          Icons.add,
                                        ),
                                        onPressed: () async {
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .getCartItems(FirebaseAuth
                                                      .instance
                                                      .currentUser
                                                      ?.uid ??
                                                  '');
                                          final snackBar = MySnackBar().mySnackBar(
                                            text: 'Item Added Successfully',
                                            context: context,
                                          );
                                          bool hasItem = false;
                                          CartModel? cartItem;
                                          final cart =
                                              Provider.of<CartProvider>(context,
                                                  listen: false);
                                          for (var item in cart.cartItems) {
                                            if (item.itemId ==
                                                provider.items[index].itemId) {
                                              hasItem = true;
                                              cartItem = item;
                                              break;
                                            }
                                          }
                                          if (hasItem) {
                                            await cart
                                                .increaseQuantity(cartItem!);
                                          } else {
                                            await cart.addItem(
                                              CartModel(
                                                itemId: provider
                                                    .items[index].itemId,
                                                itemName: provider
                                                    .items[index].itemName,
                                                itemImage: provider
                                                    .items[index].itemImage,
                                                itemLocation:
                                                    restModel?.restLocation,
                                                itemPrice: provider
                                                    .items[index].itemPrice,
                                                orderTime: restModel?.orderTime,
                                                quantity: 1,
                                                uid: FirebaseAuth.instance
                                                        .currentUser?.uid ??
                                                    '',
                                              ),
                                            );
                                          }
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context)
                                                .hideCurrentSnackBar();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
