import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: 'No Items in Your Cart',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: ThemeColor.text,
      ),
    );
  }
}
