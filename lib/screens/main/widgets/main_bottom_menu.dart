import 'package:flutter/material.dart';
import '../../../theme/colors.dart';

class MainBottomMenu extends StatefulWidget {
  final Function(int) onChanged;

  const MainBottomMenu({
    super.key,
    required this.onChanged,
  });

  @override
  State<MainBottomMenu> createState() => _MainBottomMenuState();
}

class _MainBottomMenuState extends State<MainBottomMenu> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: ThemeColor.textLight,
          ),
      selectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: ThemeColor.primary,
          ),
      showUnselectedLabels: true,
      unselectedItemColor: ThemeColor.border,
      selectedItemColor: ThemeColor.primary,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        widget.onChanged(value);
        setState(() {
          currentIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.shopping_bag),
          icon: Icon(Icons.shopping_bag_outlined),
          label: "My Order",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.shopping_cart),
          icon: Icon(Icons.shopping_cart_outlined),
          label: "Cart",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.person_2),
          icon: Icon(Icons.person_2_outlined),
          label: "Profile",
        ),
      ],
    );
  }
}
