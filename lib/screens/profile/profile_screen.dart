import 'package:coffee/screens/profile/widgets/profile_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/user_provider.dart';
import '../../theme/colors.dart';
import '../../widgets/text_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
            ),
            const SizedBox(height: 20),
            TextWidget(
              text: 'Name:',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ThemeColor.text, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            TextWidget(
              text: Provider.of<UserProvider>(context).currentUser?.name ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ThemeColor.textLight, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            TextWidget(
              text: 'Email:',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ThemeColor.text, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            TextWidget(
              text: FirebaseAuth.instance.currentUser?.email ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ThemeColor.textLight, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: TextWidget(
                text: 'Sign Out',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: ThemeColor.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
