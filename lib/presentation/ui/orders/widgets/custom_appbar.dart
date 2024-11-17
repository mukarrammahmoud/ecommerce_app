import 'package:first_app/core/constant/components/custom_text.dart';
import 'package:flutter/material.dart';

AppBar customAppBar({required String title, double? fontSize, bool? isBold}) {
  return AppBar(
    scrolledUnderElevation: 2,
    title: AppText(
      text: title,
      fontSize: 20,
      isBold: true,
    ),
  );
}
