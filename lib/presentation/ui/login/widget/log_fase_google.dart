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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.splashColor,
                border: Border.all(
                  color: AppColor.neutralsColor.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                    size: 30,
                  ),
                  const SizedBox(width: 10),
                  AppText(
                    text: "Google",
                    textColor: AppColor.neutralsColor.withOpacity(.3),
                    isBold: true,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 5),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.splashColor,
                border: Border.all(
                  color: AppColor.neutralsColor.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.facebook_sharp,
                      color: Colors.blue, size: 30),
                  const SizedBox(width: 10),
                  AppText(
                    text: "FaseBook",
                    textColor: AppColor.neutralsColor.withOpacity(.3),
                    isBold: true,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
