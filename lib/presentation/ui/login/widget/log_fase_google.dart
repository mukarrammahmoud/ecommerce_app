import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogFaseAndGoogle extends StatelessWidget {
  const LogFaseAndGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.splashColor,
              border: Border.all(
                color: AppColor.neutralsColor.withOpacity(0.3),
              ),
            ),
            child: const Row(
              children: [
                Icon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                  size: 30,
                ),
                SizedBox(width: 10),
                AppText(text: "Google")
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.splashColor,
              border: Border.all(
                color: AppColor.neutralsColor.withOpacity(0.3),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.facebook_sharp, color: Colors.blue, size: 30),
                AppText(text: "FaseBook")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
