import 'package:first_app/core/constant/app_colors.dart';
import 'package:first_app/core/constant/components/custom_button.dart';
import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemChecOut extends StatelessWidget {
  const ItemChecOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      margin: EdgeInsets.all(5.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 2,
            child: Image.asset(
              "assets/image/shirt.png",
              width: 80.w,
              height: 100.h,
              fit: BoxFit.contain,
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: "Mens Clothes",
                  fontSize: 16.sp,
                  isBold: true,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        marginHorizntal: 15,
                        onPressed: () {},
                        color: AppColor.successColor.withOpacity(0.5),
                        title: const AppText(text: ""),
                      ),
                    ),
                    Expanded(
                      child: CustomButton(
                        marginHorizntal: 10,
                        onPressed: () {},
                        color: Colors.black,
                        title: const AppText(
                          text: "M",
                          textColor: AppColor.splashColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              AppText(
                text: "92",
                fontSize: 18.sp,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
