  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

AwesomeDialog customDialog(
      {required BuildContext context,
      required String title,
       DialogType dialogType=DialogType.info,
      required String description,
      required Function()? btnOkOnPress}) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnOkOnPress: btnOkOnPress,
    );
  }