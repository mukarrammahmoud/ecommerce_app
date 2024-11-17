import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText({
    super.key,
    required this.text,
    this.fontFamily = "Almarai",
    this.fontSize = 16,
    this.isBold = false,
    this.textColor,
    this.latterSpasing,
    this.maxLine,
    this.overflow,
    this.decoration,
  });
  final String text;
  final double? fontSize;
  final Color? textColor;
  final String? fontFamily;
  final bool isBold;
  final double? latterSpasing;
  final TextOverflow? overflow;
  final int? maxLine;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLine,
      overflow: overflow,
      text,
      style: TextStyle(
        decoration: decoration,
        color: textColor,
        fontWeight: isBold ? FontWeight.bold : null,
        fontFamily: fontFamily,
        fontSize: fontSize,
        letterSpacing: latterSpasing,
      ),
    );
  }
}
