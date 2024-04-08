import 'package:coffee/models/rest_model.dart';
import 'package:flutter/material.dart';

class MenuImageView extends StatelessWidget {
  final RestModel? restModel;
  const MenuImageView({super.key, this.restModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            width: double.maxFinite,
            fit: BoxFit.fitWidth,
            image: MemoryImage(
              restModel!.restImage!,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
