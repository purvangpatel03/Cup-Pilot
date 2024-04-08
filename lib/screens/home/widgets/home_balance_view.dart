import 'package:coffee/provider/user_provider.dart';
import 'package:coffee/theme/colors.dart';
import 'package:coffee/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/snack_bar_widget.dart';

class HomeBalanceView extends StatefulWidget {
  const HomeBalanceView({super.key});

  @override
  State<HomeBalanceView> createState() => _HomeBalanceViewState();
}

class _HomeBalanceViewState extends State<HomeBalanceView> {
  @override
  Widget build(BuildContext context) {
    Provider.of<UserProvider>(context, listen: true)
        .getUser(FirebaseAuth.instance.currentUser?.uid ?? '');
    return Row(
      children: [
        const SizedBox(width: 16),
        Flexible(
          flex: 7,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              color: ThemeColor.lightWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ThemeColor.border,
                width: 0.4,
              ),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Your Balance",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ThemeColor.textLight,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        TextWidget(
                          text: "Rs.",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: ThemeColor.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                        Consumer<UserProvider>(
                            builder: (context, provider, child) {
                          return TextWidget(
                            text:
                                provider.currentUser?.balance.toString() ?? '0',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: ThemeColor.text,
                                  fontWeight: FontWeight.w700,
                                ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                FloatingActionButton(
                  mini: true,
                  child: const Icon(
                    Icons.add,
                  ),
                  onPressed: () async {
                    final snackBar = MySnackBar().mySnackBar(
                      text: '100 Rs. Added',
                      context: context,
                      backgroundColor: ThemeColor.text,
                      elevation: 4,
                      duration: 1,
                      textColor: ThemeColor.white,
                    );
                    final user =
                        Provider.of<UserProvider>(context, listen: false)
                            .currentUser!;
                    int balance = user.balance + 100;
                    await Provider.of<UserProvider>(context, listen: false)
                        .updateBalance(user.docId ?? '', balance);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: ThemeColor.primary,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: ThemeColor.border,
                width: 0.4,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.monetization_on_rounded,
                  color: ThemeColor.secondary,
                  size: 16,
                ),
                const SizedBox(height: 4),
                TextWidget(
                  text: "You have",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ThemeColor.white,
                        fontSize: 10,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                TextWidget(
                  text: "435 Point",
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: ThemeColor.secondary,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
