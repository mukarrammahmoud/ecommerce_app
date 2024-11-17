import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class Coins extends StatelessWidget {
  const Coins({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });
  final IconData icon;
  final String value;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 48, 47, 47),
            child: Icon(
              icon,
              color: AppColor.splashColor,
            ),
          ),
          Column(
            children: [
              AppText(
                text: value,
                textColor: AppColor.warrningColor,
                isBold: true,
              ),
              AppText(
                text: title,
                textColor: const Color.fromARGB(255, 172, 170, 166),
                isBold: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
