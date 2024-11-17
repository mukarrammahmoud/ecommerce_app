import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class ItemOfCategory extends StatelessWidget {
  const ItemOfCategory({
    super.key,
    required this.pathImage,
    required this.title,
  });
  final String pathImage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(
            maxRadius: 40,
            backgroundImage: NetworkImage(
              pathImage,
            ),
          ),
          AppText(
            text: title,
            fontSize: 20,
          )
        ],
      ),
    );
  }
}
