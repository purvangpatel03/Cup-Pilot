import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class OrderItemAppBar extends StatelessWidget implements PreferredSizeWidget{
  const OrderItemAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back)),
    title: TextWidget(
      text: 'Order Items',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: ThemeColor.text,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
      ),
    ],
    );
  }
}
