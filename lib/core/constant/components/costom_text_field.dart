// ignore_for_file: file_names

import 'package:first_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType = TextInputType.name,
    this.icon,
    this.iconPrifex,
    this.padding = 2,
    required this.hintText,
    required this.isVissabileContent,
    required this.validate,
    required this.controller,
    this.autoFoucs = false,
  });
  final Widget? icon;
  final Widget? iconPrifex;

  final String hintText;
  final bool isVissabileContent;
  final bool autoFoucs;
  final String? Function(String? val) validate;
  final double padding;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: TextFormField(
        autofocus: autoFoucs,
        controller: controller,
        keyboardType: keyboardType,
        validator: validate,
        obscureText: isVissabileContent,
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 10, vertical: padding),
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            suffix: iconPrifex,
            prefixIcon: icon,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: AppColor.neutralsColor.withOpacity(0.3), width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: AppColor.neutralsColor.withOpacity(0.3))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: AppColor.neutralsColor.withOpacity(0.3))),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: AppColor.neutralsColor.withOpacity(0.5)))),
      ),
    );
  }
}
