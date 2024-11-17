
import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

class BottomSheetSetting extends StatelessWidget {
  const BottomSheetSetting({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 4,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(
            widthContainer: MediaQuery.sizeOf(context).width,
            onPressed: () {},
            title: const Row(
              children: [
                Icon(
                  Icons.done_all,
                  color: AppColor.splashColor,
                ),
                AppText(
                  text: 'Mark All Read',
                  fontSize: 20,
                  textColor: AppColor.splashColor,
                ),
              ],
            ),
          ),
          CustomButton(
            color: AppColor.errorColor.withOpacity(0.2),
            widthContainer: MediaQuery.sizeOf(context).width,
            onPressed: () {},
            title: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: AppColor.errorColor.withOpacity(0.5),
                ),
                AppText(
                  text: 'Delete All Notification',
                  fontSize: 20,
                  textColor: AppColor.errorColor.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
