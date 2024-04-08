import 'package:coffee/screens/menu/widgets/menu_app_bar.dart';
import 'package:coffee/screens/menu/widgets/menu_header_view.dart';
import 'package:coffee/screens/menu/widgets/menu_image_view.dart';
import 'package:coffee/screens/menu/widgets/menu_item_list.dart';
import 'package:flutter/material.dart';

import '../../models/rest_model.dart';

class MenuScreen extends StatefulWidget {
  final RestModel? restModel;
  final int currentIndex;

  const MenuScreen({super.key, required this.restModel, required this.currentIndex});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuHeaderView(
                restModel: widget.restModel,
              ),
              MenuImageView(
                restModel: widget.restModel,
              ),
              MenuItemList(
                restModel: widget.restModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
