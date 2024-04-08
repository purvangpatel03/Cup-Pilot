import 'package:coffee/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/colors.dart';
import '../../../widgets/text_widget.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 58,
      leading: Container(
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: ThemeColor.textLight.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
      ),
      centerTitle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer<UserProvider>(
            builder: (context, provider, child) {
              return TextWidget(
                text: 'Hi, ${provider.currentUser?.name ?? ''}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ThemeColor.textLight,
                    ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 16,
                color: ThemeColor.text,
              ),
              const SizedBox(width: 4),
              TextWidget(
                text: "Chenango, New York",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: ThemeColor.text,
                    ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: ThemeColor.border,
            ),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(right: 16),
          child: Icon(
            Icons.notifications_outlined,
            size: 24,
            color: ThemeColor.text,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
