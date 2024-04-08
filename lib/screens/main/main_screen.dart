import 'package:coffee/screens/home/home_screen.dart';
import 'package:coffee/screens/main/widgets/main_bottom_menu.dart';
import 'package:coffee/screens/orders/order_screen.dart';
import 'package:coffee/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../cart/cart_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MainBottomMenu(
        onChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    switch (currentIndex) {
      case 1:
        return const OrderScreen();
      case 2:
        return const CartScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}
