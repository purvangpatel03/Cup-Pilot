import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      text: 'No Orders',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: ThemeColor.text,
      ),
    );
  }
}
