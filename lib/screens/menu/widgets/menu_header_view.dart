import 'package:coffee/models/rest_model.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class MenuHeaderView extends StatelessWidget {
  final RestModel? restModel;
  const MenuHeaderView({super.key, this.restModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            TextWidget(
              text: restModel?.restName ?? '',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700, color: ThemeColor.text),
            ),
            const Spacer(),
            const Icon(
              size: 20,
              Icons.favorite_border,
            ),
          ],
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
                  ?.copyWith(color: ThemeColor.textLight),
            ),
            const SizedBox(
              width: 8,
            ),
            TextWidget(
              text: restModel?.orderTime ?? '',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: ThemeColor.textLight,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
